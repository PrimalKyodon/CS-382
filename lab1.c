/*
 * Author: Aaren Patel
 * Assignment: Lab 1
 * Date: 9/12/23
 * I pledge my honor that I have abided by the Stevens Honor System
 */

#include <stdio.h>
#include <stdlib.h>

void display(int8_t bit) {
    putchar(bit + 48);
}

void display_32(int32_t num) {
    int32_t min = -2147483648;
    for (int i = 31; i >= 0; i--){
        int32_t bit = num & min;
        if (bit == 0)
            display(0);
        else {
            display(1);
            num = num - bit;
        }
        min = min >> 1;
    }
}

int main(int argc, char const *argv[]) {
    
    display_32(382);
    printf("\n");
    display_32(-382);
    return 0;
}
