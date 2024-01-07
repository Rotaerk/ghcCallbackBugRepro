#include <stddef.h>
#include <stdint.h>

typedef void (*PtrAll64)(uint64_t p1, uint64_t p2, uint64_t p3, uint64_t p4, uint64_t p5, uint64_t p6, uint64_t p7, uint64_t p8);
typedef void (*PtrOne32)(uint64_t p1, uint64_t p2, uint32_t p3, uint64_t p4, uint64_t p5, uint64_t p6, uint64_t p7, uint64_t p8);
typedef void (*PtrTwo32)(uint64_t p1, uint32_t p2, uint32_t p3, uint64_t p4, uint64_t p5, uint64_t p6, uint64_t p7, uint64_t p8);

void callMe(PtrAll64 ptrAll64, PtrOne32 ptrOne32, PtrTwo32 ptrTwo32)
{
  (*ptrAll64)(1,2,3,4,5,6,7,8);
  (*ptrOne32)(1,2,3,4,5,6,7,8);
  (*ptrTwo32)(1,2,3,4,5,6,7,8);
}
