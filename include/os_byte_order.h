#ifndef __OS_BYTE_ORDER_H__
#define __OS_BYTE_ORDER_H__

#include <byteswap.h>

#define XATTR_MAXNAMELEN 127

#define OSSwapHostLongToBig(x)		cpu_to_be64(x)
#define OSSwapBigShortToHost(x) 	be16_to_cpu(x)
#define OSSwapBigToHostInt16(x)		be16_to_cpu(x)
#define OSSwapBigLongToHost(x)		be32_to_cpu(x)
#define OSSwapBigToHostInt32(x)		be32_to_cpu(x)
#define OSSwapBigLongLongToHost(x) 	be64_to_cpu(x)
#define OSSwapBigToHostInt64(x)		be64_to_cpu(x)
#define OSSwapHostToBigInt32(x)		cpu_to_be32(x)
#define OSSwapInt16(x)              be16_to_cpu(x)
#define OSSwapInt32(x)              be32_to_cpu(x)
#define OSSwapInt64(x)              be64_to_cpu(x)

#if __BYTE_ORDER == __LITTLE_ENDIAN
/* Big Endian Swaps */
#ifndef be16_to_cpu
#define be16_to_cpu(x) bswap_16(x)
#endif
#ifndef be32_to_cpu
#define be32_to_cpu(x) bswap_32(x)
#endif
#ifndef cpu_to_be32
#define cpu_to_be32(x) bswap_32(x)
#endif
#ifndef be64_to_cpu
#define be64_to_cpu(x) bswap_64(x)
#endif
#ifndef cpu_to_be64
#define cpu_to_be64(x) bswap_64(x)
#endif
#elif __BYTE_ORDER == __BIG_ENDIAN
/* Big endian doesn't swap */
#ifndef be16_to_cpu
#define be16_to_cpu(x)	(x)
#endif
#ifndef be32_to_cpu
#define be32_to_cpu(x)	(x)
#endif
#ifndef cpu_to_be32
#define cpu_to_be32(x)	(x)
#endif
#ifndef be64_to_cpu
#define be64_to_cpu(x)	(x)
#endif
#ifndef cpu_to_be64
#define cpu_to_be64(x) 	(x)
#endif
#endif

#endif //__OS_BYTE_ORDER_H__
