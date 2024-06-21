# HFSUtils [WIP]
tools to handle hfs partitions

## Ported tools
1. newfs_hfs
2. fsck_hfs

## Instalation
### Deb-based(using PPA)
```bash

```


### Arch-based(using AUR)
```bash
$ yay -S HFSUtils-git
```

## Dependencies
### MacOS
1. [XNU headers]
2. [CTF tools]
3. [AvailabilityVersions]
4. [libfirehose]

### install dependencies
[OSX_DEPS]

### Debian
1. libbsd-dev
2. uuid-dev
3. libblocksruntime-dev

#### install dependencies
```bash
$ apt install libbsd-dev uuid-dev libblocksruntime-dev
```

### ArchLinux
1. libbsd
2. libdispatch

#### install dependencies
```bash
$ pacman -S libdispatch libbsd
```

## Tests 
1. gtest

## Compilation
```bash
$ mkdir build
$ cd build
$ cmake .. -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
$ make install
```

## Usage
```bash
$ newfs_hfs [-N [partition-size]] [hfsplus-options] special-device
```

```bash
$ fsck_hfs [-b [size] B [path] c [size] e [mode] ESdfglx m [mode] npqruy] special-device
```

[XNU headers]: https://github.com/apple-oss-distributions/xnu
[CTF tools]: https://github.com/apple-oss-distributions/dtrace
[AvailabilityVersions]: https://github.com/apple-oss-distributions/AvailabilityVersions
[libfirehose]: https://github.com/apple-oss-distributions/libdispatch
[OSX_DEPS]: OSX_DEPS.md


# Original Readme

-- How to build the HFS Kexts --

1. Install headers from XNU.  Typically, after downloading the XNU
source, you want to do something like:

$ mkdir -p BUILD.hdrs/obj BUILD.hdrs/sym BUILD.hdrs/dst

$ make installhdrs SDKROOT=macosx ARCH_CONFIGS=X86_64 SRCROOT=$PWD \
	OBJROOT=$PWD/BUILD.hdrs/obj SYMROOT=$PWD/BUILD.hdrs/sym \
	DSTROOT=$PWD/BUILD.hdrs/dst

$ sudo ditto BUILD.hdrs/dst `xcrun -sdk macosx -show-sdk-path`

2. Build the Kexts:

$ xcodebuild -target kext -target encodings-kext SDKROOT=macosx

N.B. At the time of writing, the other HFS targets are known not to
build outside of Apple's internal build environment.
