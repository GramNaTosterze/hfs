#ifndef __APPLE_TYPES_H__
#define __APPLE_TYPES_H__

#include <errno.h>
#include <stdint.h>
#include <bsd/sys/cdefs.h>

typedef	char uuid_string_t[37];

#ifndef BSD
#define BSD 1
#endif

#define KAUTH_FILESEC_XATTR "com.apple.system.Security"

#define UF_IMMUTABLE    0x00000002
#define XATTR_MAXNAMELEN 127
#define MAXBSIZE		(256 * 4096)
#define __unused

#ifndef TRUE
#define TRUE			1
#endif
#ifndef FALSE
#define FALSE			0
#endif

/* Mac types */

/* 8 Bit */
#ifndef UInt8
#define UInt8			uint8_t
#endif
#ifndef u_int8_t
#define u_int8_t		UInt8
#endif
#ifndef SInt8
#define SInt8			int8_t
#endif

/* 16 Bit */
#ifndef UInt16
#define UInt16			uint16_t
#endif
#ifndef u_int16_t
#define u_int16_t		UInt16
#endif
#ifndef SInt16
#define SInt16			int16_t
#endif

/* 32 Bit */
#ifndef UInt32
#define UInt32			uint32_t
#endif
#ifndef u_int32_t
#define u_int32_t		UInt32
#endif
#ifndef SInt32
#define SInt32			int32_t
#endif

/* 64 Bit */
#ifndef UInt64
#define UInt64			uint64_t
#endif
#ifndef u_int64_t
#define u_int64_t		UInt64
#endif
#ifndef SInt64
#define SInt64			int64_t
#endif

#define UniChar			u_int16_t
#define Boolean			u_int8_t

#define UF_NODUMP	0x00000001

/* syslimits.h */
#define NAME_MAX	255

#endif //__APPLE_TYPES_H__
