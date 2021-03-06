#! /bin/sh

# init.sh location assumes ../build/ directory to run this,
# file will help compiling all toolchain

# clone everything
git clone http://llvm.org/git/llvm.git
cd llvm/tools
git clone http://llvm.org/git/clang.git
cd ../projects
git clone http://llvm.org/git/compiler-rt.git
mkdir ../build


#now we build
cd ../build
cmake -G Ninja -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly ..
ninja
cd ../..

# binaryen
git clone https://github.com/WebAssembly/binaryen.git
cd binaryen
mkdir build
cd build
cmake -G Ninja ..
ninja
cd ../..

# WABT
git clone --recursive https://github.com/WebAssembly/wabt
cd wabt
make
