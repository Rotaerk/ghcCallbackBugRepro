#include <stdint.h>

typedef uint64_t (*CallbackPtr)(uint64_t p1, uint64_t p2, uint64_t p3, uint64_t p4, uint64_t p5, uint64_t p6, uint64_t p7, uint64_t p8);

uint64_t callMe(CallbackPtr callbackPtr)
{
  return (*callbackPtr)(1,2,3,4,5,6,7,8);
}
