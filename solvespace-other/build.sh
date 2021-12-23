set -e
cd /mnt/build
cmake /mnt/source -DCMAKE_BUILD_TYPE=Release -DENABLE_OPENMP=ON
make -j$(nproc --ignore=2)
make install
