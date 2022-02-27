# ./Configure --prefix=/home/time4ruin/Desktop/css/openssl_frkd/ --openssldir=/home/time4ruin/Desktop/css/openssl_frkd/ -Wl,-rpath,/home/time4ruin/Desktop/css/openssl_frkd/
A=$(which as)
B=$(ls -l $A)
C=${B#*-\> }

D=$(which gcc)
E=$(ls -l $A)
F=${B#*-\> }

echo "abc123" | sudo -S ln -Tfs /usr/bin/x86_64-linux-gnu-as /usr/bin/as
echo "abc123" | sudo -S ln -Tfs /usr/bin/gcc-7 /usr/bin/gcc
echo $(ls -al /usr/bin/as)
./Configure > /dev/null 2>&1
make > /dev/null 2>&1
echo $(ls -al ./test/bntest)
echo $(ls -al ./crypto/bn/libcrypto-shlib-bn_exp.o)
echo "abc123" | sudo -S perf stat -e page-faults,br_inst_retired.conditional,br_misp_retired.conditional ./test/bntest >/dev/null

echo "abc123" | sudo -S ln -Tfs $C /usr/bin/as
echo "abc123" | sudo -S ln -Tfs $F /usr/bin/gcc
echo $(ls -al /usr/bin/as)
make clean > /dev/null 2>&1
make > /dev/null 2>&1
echo $(ls -al ./test/bntest)
echo $(ls -al ./crypto/bn/libcrypto-shlib-bn_exp.o)
echo "abc123" | sudo -S perf stat -e page-faults,br_inst_retired.conditional,br_misp_retired.conditional ./test/bntest >/dev/null
