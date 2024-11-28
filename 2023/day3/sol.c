#include "/Users/liema/Code/C/phutils/include/phutils.h"

int main(int argc, char** argv) {
  char* inp = phu_readfile("./input.txt");
  phu_pprintlist(inp);
  return 0;
}
