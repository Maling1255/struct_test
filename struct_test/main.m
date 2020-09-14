//
//  main.m
//  struct_test
//
//  Created by maling on 2020/9/14.
//  Copyright © 2020 maling . All rights reserved.
//

#import <Foundation/Foundation.h>

struct Struct1 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    char b;     // 1         4                 (4)
    short d;    // 2         6                 (6 7)
}struct1;  // => 8

struct Struct2 {
    //           占字节数     起始位置            占的位置
    char b;     // 1         0                 (0)
    int c;      // 4         4                 (4 5 6 7)
    short d;    // 2         8                 (8 9)
}struct2;  // => 12

struct Struct3 {
    //           占字节数     起始位置            占的位置
    double a;   // 8         0                 (0 1 2 3 4 5 6 7)
    char b;     // 1         8                 (8)
    int c;      // 4         9                 (12 13 14 15)
    short d;    // 2         16                (16 17)
}struct3;  // => 24


struct Struct2_1 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    char b;     // 1         16                (16)
    struct Struct1 struct1;   // 4             (20 21 22 23 24 25 26 27)  ==> struct1 内存大小 8
    short d;    // 2         28                (28 29)
}struct2_1;  // => 32

struct Struct2_2_1 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    char b;     // 1         16                (16)
    struct Struct2 struct2;   // 4             (20 21 22 23 24 25 26 27 28 29 30 31)  ==> struct2 内存大小 12
    short d;    // 2         32                (32 33)
}struct2_2_1;  // => 40

struct Struct2_2_2 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    char b;     // 1         16                (16)
    short d;    // 2         17                (18 19)
    struct Struct2 struct2;   // 4             (20 21 22 23 24 25 26 27 28 29 30 31)  ==> struct2 内存大小 12
}struct2_2_2;  // => 32

struct Struct2_2_3 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    struct Struct2 struct2;   // 4             (16 17 18 19 20 21 22 23 24 25 26 27)  ==> struct2 内存大小 12
    char b;     // 1         28                (28)
    short d;    // 2         29                (30 31)
}struct2_2_3;  // => 32


struct Struct2_1_1 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    struct Struct3 struct3;   // 8             (16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39)  ==> struct3 内存大小 24
    char b;     // 1         40                (40)
    short d;    // 2         41                (42 43)
}struct2_1_1;  // => 48

struct Struct2_1_2 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    char b;     // 1         16                (16)
    struct Struct3 struct3;   // 8             (24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47)  ==> struct3 内存大小 24
    short d;    // 2         48                (48 49)
}struct2_1_2;  // => 56


struct Struct2_2 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    char b;     // 1         16                (16)
    struct Struct2 struct2;          // 4      (20 21 22 23 24 25 26 27 28 29 30 31)  ==> struct2 内存大小 12
    short d;    // 2         32                (32 33)
}struct2_2;  // => 40
 
struct Struct2_3 {
    //           占字节数     起始位置            占的位置
    int c;      // 4         0                 (0 1 2 3)
    double a;   // 8         4                 (8 9 10 11 12 13 14 15)
    char b;     // 1         16                (16)
    struct Struct3 struct3;          // 8      (24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47)
    short d;    // 2         48                (48 49)
}struct2_3;  // => 56

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"\n\nstruct1: %lu \nstruct2: %lu \nstruct3: %lu ", sizeof(struct1), sizeof(struct2), sizeof(struct3));
        
        NSLog(@"\n\nstruct2_1: %lu \nstruct2_2: %lu \nstruct2_3: %lu", sizeof(struct2_1), sizeof(struct2_2), sizeof(struct2_3));
        
        NSLog(@"\n\nstruct2_2_1: %lu \nstruct2_2_2: %lu \nstruct2_2_3: %lu \nstruct2_1_1: %lu \nstruct2_1_2: %lu", sizeof(struct2_2_1), sizeof(struct2_2_2), sizeof(struct2_2_3), sizeof(struct2_1_1), sizeof(struct2_1_2));
    }
    return 0;
}
