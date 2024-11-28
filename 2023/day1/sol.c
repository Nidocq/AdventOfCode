#include "/Users/liema/Code/C/phutils/include/phutils.h"
#include<stdlib.h>
#include<stdio.h>
int main(int argc, char** argv) {
  (void)argc;
  (void)argv;
  char* inp = phu_readfile("./input.txt");

  char** split = phu_strsplit(inp, '\n');
  int splitlen = phu_lstlen(split);
  size_t sum = 0;
  for (size_t i = 0; i < splitlen; i++) {
    //
    // get the length of the string
    size_t strsize = 1;
    for (;split[i][strsize]; strsize++);
    int leftint = 0; 
    int rightint = 0; 
    
    // find the first instance of a number
    for (size_t j = 0; j < strsize; j++) {
      if ('0' <= split[i][j] && split[i][j] <= '9') {
        leftint = split[i][j] - '0';
        break;
      }
    }
    // reverse string and find first instance of number
    char* revstr = phu_strrev(strsize, split[i]);
    for (size_t j = 0; j < strsize; j++) {
      if ('0' <= revstr[j] && revstr[j] <= '9') {
        rightint = revstr[j] - '0';
        break;
      }
    }

    // concat strnumbers together
    // https://stackoverflow.com/questions/12700497/how-to-concatenate-two-integers-in-c
    unsigned pow = 10;
    while(rightint >= 10) {
      pow *= 10;
    }
    int concatints = leftint * pow + rightint;
    sum += concatints;
  }

   printf("sum : %zu\n", sum);
   return 0;
}
