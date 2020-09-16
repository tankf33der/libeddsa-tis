#include <stdlib.h>
#include <stdio.h>
#include "eddsa.h"
#include "sha512.h"

typedef uint8_t u8;

#define ARRAY(name, size) \
    u8 name[size]; \
    for(size_t i = 0; i < size; i++) name[i] = i;

void sign_check(void) {
    ARRAY(hash, 64);
    ARRAY(key,  32);
    ARRAY(pub,  32);
    ARRAY(in,   32);
    ed25519_genpub(pub, key);
    ed25519_sign(hash, key, pub, in, 32);
    ed25519_verify(hash, pub, in, 32);
}

void sha512(void) {
    ARRAY(hash,  64);
    ARRAY(in  , 128);
    struct sha512 ctx;

    sha512_init(&ctx);
    for(size_t i = 0; i < 128; i++)
        sha512_add(&ctx, in, i);
    sha512_final(&ctx, hash);
}

int main(void) {
    sign_check();
	// disable for left shift
    //x25519();
    sha512();
    return 0;
}
