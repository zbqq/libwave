#!/bin/bash
set -e  # exit on first error

clone_libwave() {
    git clone https://github.com/wavelab/libwave
}

install_deps() {
    cd libwave
    bash scripts/install.bash
    cd -
}

compile_libwave() {
    cd libwave
    mkdir -p build
    git submodule init
    git submodule update
    cd build
    cmake ..
    make
    cd ../..
}

# MAIN
echo "Continuing with this script will:"
echo "1. clone libwave to the current directory"
echo "2. download and install its dependencies"
echo "3. compile libwave for you"

while true
do
    read -r -p "Do you want to continue? (y/n): " choice
    case "$choice" in
        n|N) break;;
        y|Y)
            clone_libwave
            install_deps
            compile_libwave
        break
        ;;
        *) echo 'Invalid input! Please answer y or n!';;
    esac
done