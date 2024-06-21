#ifndef	_SYS_DISK_H_
#define	_SYS_DISK_H_

#include <sys/ioctl.h>
#include <sys/types.h>

#define DKIOCGETBLOCKSIZE                BLKSSZGET
#define DKIOCGETBLOCKCOUNT               _IOR('d', 25, u_int64_t)

//#define DKIOCGETMAXBLOCKCOUNTREAD        _IOR('d', 64, u_int64_t)
//#define DKIOCGETMAXBLOCKCOUNTWRITE       _IOR('d', 65, u_int64_t)
//#define DKIOCGETMAXBYTECOUNTREAD         _IOR('d', 70, u_int64_t)
//#define DKIOCGETMAXBYTECOUNTWRITE        _IOR('d', 71, u_int64_t)

#endif	/* _SYS_DISK_H_ */
