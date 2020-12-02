#include <stdio.h>

int test_value(int a);

int
main(int argc, char* argv[]) {
  int result = test_value(argc);
  printf("test\n");
  if (result) {
  	printf("%d\n", result);
  }
  return result;
}

int test_value(int a){
  return a;
}
