if [[ `uname` == "Linux" ]]; then
    export LDSHARED_FLAGS="-shared -pthread"
else
    # For OSX builds, reset the include and linker root path for clang
    export CFLAGS="-Wl,-syslibroot / -isysroot / ${CFLAGS}"
    export LDSHARED_FLAGS="-bundle -undefined dynamic_lookup"
fi

./configure \
    --with-python=${PREFIX}   \
    --with-uuid=${PREFIX} \
    --with-udunits2=${PREFIX} \
    --with-netcdf=${PREFIX} \
    --with-libjson-c=${PREFIX} \
    --prefix=${PREFIX}
make
make install
## END BUILD

