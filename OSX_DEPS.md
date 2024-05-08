# Short Guide to compile OSX dependencies

## Build tools
1. git
2. xcode

#### Build CTF tools from dtrace
```bash
$ git clone https://github.com/apple-oss-distributions/dtrace
$ cd dtrace
$ xcodebuild install -sdk macosx -target ctfconvert \
$ -target ctfdump -target ctfmerge \
$ ARCHS='x86_64 arm64' VALID_ARCHS='x86_64 arm64' DSTROOT=$PWD/dst
$ export TOOLCHAIN=`cd $(xcrun -sdk macosx -show-sdk-platform-path)/../../Toolchains/XcodeDefault.xctoolchain && pwd`
$ sudo ditto "$PWD/dst/$TOOLCHAIN" "$TOOLCHAIN"
$ cd ..
```
#### Install AvailabilityVersions
```bash
$ git clone https://github.com/apple-oss-distributions/AvailabilityVersions
$ cd AvailabilityVersions
$ make install
$ sudo ditto "$PWD/dst/usr/local/libexec" \
$ "$(xcrun -sdk macosx -show-sdk-path)/usr/local/libexec"
$ cd ..
```
### Install XNU headers
```bash
$ git clone https://github.com/apple-oss-distributions/xnu
$ cd xnu
$ make SDKROOT=macosx ARCH_CONFIGS="X86_64 ARM64" installhdrs
$ sudo ditto "$PWD/BUILD/dst" "$(xcrun -sdk macosx -show-sdk-path)"
$ cd ..
```
### Build libfirehose from libdispatch
```bash
$ git clone https://github.com/apple-oss-distributions/libdispatch
$ cd libdispatch
$ xcodebuild install -sdk macosx ARCHS='x86_64 arm64e' \
$ VALID_ARCHS='x86_64 arm64e' -target libfirehose_kernel \
$ PRODUCT_NAME=firehose_kernel DSTROOT=$PWD/dst
$ sudo ditto "$PWD/dst/usr/local" \
$ "$(xcrun -sdk macosx -show-sdk-path)/usr/local"
$ cd ..
```

## references
[Building XNU Headers]

[Building XNU Headers]: https://kernelshaman.blogspot.com/2021/02/building-xnu-for-macos-112-intel-apple.html
