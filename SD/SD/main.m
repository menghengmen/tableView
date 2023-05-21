//
//  main.m
//  SD
//
//  Created by 哈哈 on 2022/7/21.
//  Copyright © 2022 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include <stdio.h>
#include <string.h>
#include <openssl/ecdsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>



//私钥签名
int my_sign(const char *input, int input_len, const char *pri_key_fn)
{
    EC_KEY *p_dsa = NULL;
    ECDSA_SIG *s;
    FILE *file = NULL;
    unsigned char *data[2];
    int nid;
    int signlen = 0;
    int i = 0;
    int ret = 0;
    unsigned char digest[EVP_MAX_MD_SIZE];
    unsigned int digest_len = 0;
    EVP_MD_CTX* md_ctx;

    memset(data, 0x00, sizeof(data));
    nid = 0;
    file = fopen(pri_key_fn, "rb");
    if(!file)
    {
        ret = -1;
        return ret;
    }

    if((p_dsa = PEM_read_ECPrivateKey(file, NULL, NULL, NULL)) == NULL) { // 获取私钥的ec key
        ret = -2;
        fclose(file);
        return ret;
    }

    fclose(file);
    EVP_MD_CTX_init(&md_ctx);
    if (!EVP_DigestInit(&md_ctx, EVP_sha256())) {
        printf("EVP_digest fail \n");
        return -1;
    }
    if (!EVP_DigestUpdate(&md_ctx, (const void *)input, input_len)) {
        printf("EVP_DigestUpdate fail \n");
        return -1;
    }
    if (!EVP_DigestFinal(&md_ctx, digest, &digest_len)) { // 待签名消息用sha256生成256比特的签名摘要
        printf("EVP_DigestFinal fail \n");
        return -1;
    }

    printf("sign digest: %s\n", digest);
    s = ECDSA_do_sign(digest, digest_len, p_dsa); // 对签名摘要进行签名得到签名数据s
    if(s == NULL) {
        ret = -3;
        EC_KEY_free(p_dsa);
        return ret;
    }

//    data[0] = BN_bn2hex(s->r); //二进制转十六进制
//    data[1] = BN_bn2hex(s->s);

    EC_KEY_free(p_dsa);
    ECDSA_SIG_free(s);

    printf("%s\n", data[0]);
    printf("%s\n", data[1]);

    free(data[0]);
    free(data[1]);

    return 0;
}


int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    
    
    
    char src[512+1];
         char dst_str[2][512+1];
         int src_len;
         int ret;
         FILE *f;

         memset(src, 0x00, sizeof(src));
         memset(dst_str, 0x00, sizeof(dst_str));

            strcpy(src, "hello world"); // 待签名消息
               src_len = strlen(src) ;
               ret = my_sign(src, src_len, argv[2]);
    
                   if(ret) {
                        fprintf(stderr, "Error\n");
                       }
    
//         if(argv[1][0] == 's') {
//           
//             if(ret) {
//                     fprintf(stderr, "Error\n");
//             }
//         }
    
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}


// base64 编码
char *base64_encode(const char *buffer, int length) {
    BIO *bmem = NULL;
    BIO *b64 = NULL;
    BUF_MEM *bptr;
    char *buff = NULL;
    
    b64 = BIO_new(BIO_f_base64());
    BIO_set_flags(b64, BIO_FLAGS_BASE64_NO_NL);
    bmem = BIO_new(BIO_s_mem());
    b64 = BIO_push(b64, bmem);
    BIO_write(b64, buffer, length);
    BIO_flush(b64);
    BIO_get_mem_ptr(b64, &bptr);
    BIO_set_close(b64, BIO_NOCLOSE);

    buff = (char *)malloc(bptr->length + 1);
    memcpy(buff, bptr->data, bptr->length);
    buff[bptr->length] = 0;
    BIO_free_all(b64);

    return buff;
}

// base64 解码
char *base64_decode(char *input, int length) {
    BIO *b64 = NULL;
    BIO *bmem = NULL;
    char *buffer = NULL;
    buffer = (char *)malloc(length);
    memset(buffer, 0, length);
    b64 = BIO_new(BIO_f_base64());
    BIO_set_flags(b64, BIO_FLAGS_BASE64_NO_NL);
    bmem = BIO_new_mem_buf(input, length);
    bmem = BIO_push(b64, bmem);
    BIO_read(bmem, buffer, length);
    BIO_free_all(bmem);

    return buffer;
}

//公钥验证签名
int my_verify(const char *input, int input_len, ECDSA_SIG *signret, const char *pub_key_fn)
{
    EC_KEY *p_dsa = NULL;
    FILE *file = NULL;
    int ret = 0;
    unsigned char digest[EVP_MAX_MD_SIZE];
    unsigned int digest_len = 0;
    EVP_MD_CTX *md_ctx;
    if((file = fopen(pub_key_fn, "rb")) == NULL) {
        ret = -1;
        return ret;
    }

    if((p_dsa = PEM_read_EC_PUBKEY(file, NULL,NULL,NULL )) == NULL) { // 获取公钥的ec key
        ret = -2;
        fclose(file);
        return ret;
    }

    fclose(file);
    EVP_MD_CTX_init(&md_ctx);
    if (!EVP_DigestInit(&md_ctx, EVP_sha256())) {
        printf("EVP_digest fail \n");
        return -1;
    }
    if (!EVP_DigestUpdate(&md_ctx, (const void *)input, input_len)) {
        printf("EVP_DigestUpdate fail \n");
        return -1;
    }
    if (!EVP_DigestFinal(&md_ctx, digest, &digest_len)) { // 待签名消息用sha256生成256比特的签名摘要
        printf("EVP_DigestFinal fail \n");
        return -1;
    }

    printf("verify digest: %s\n", digest);

    ret = ECDSA_do_verify(digest, digest_len, signret, p_dsa); // 对签名摘要进行验签得到结果

    if (ret == -1) {
        ret = -3;
        printf("ECDSA_verify err!\n");
        EC_KEY_free(p_dsa);
        return ret;
    } else if (ret == 0) {
        ret = -3;
        printf("ECDSA_verify err incorrect signature!\n");
        EC_KEY_free(p_dsa);
        return ret;
    } else {
       printf("ECDSA_verify ok\n");
    }
    printf("verify is ok!\n");

    EC_KEY_free(p_dsa);

    return 0;
}



