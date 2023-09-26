#include <stdio.h>

int sum(int a, int b){
    int c = a + b;
    // printf("%d", c);
    c = a - b;
    c = a * b;
    c = a / b;
    return c;
}

int main(){
    int a = 1, b = 2;
    int c = a + b;
    printf("%d", c);
    c = a - b;
    c = a * b;
    c = a / b;
    return 0;
}