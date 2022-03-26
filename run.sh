# ./Configure --prefix=/home/time4ruin/Desktop/css/openssl_frkd/ --openssldir=/home/time4ruin/Desktop/css/openssl_frkd/ -Wl,-rpath,/home/time4ruin/Desktop/css/openssl_frkd/
argc=$#

if [ 1 -eq $argc ]
then
    args_1=$1
    echo "directory of custom gcc/as : "$args_1

    A=$(which as)
    B=$(ls -l $A)
    C=${B#*-\> }

    D=$(which gcc)
    E=$(ls -l $A)
    F=${B#*-\> }

    echo "abc123" | sudo -S ln -Tfs $args_1/as.out /usr/bin/as
    echo "abc123" | sudo -S ln -Tfs $args_1/gcc.out /usr/bin/gcc
    echo $(ls -al /usr/bin/gcc)
    echo $(ls -al /usr/bin/as)
    ./Configure > /dev/null 2>&1
    make > /dev/null 2>&1
    echo $(ls -al ./test/bntest)
    echo $(ls -al ./crypto/bn/libcrypto-shlib-bn_exp.o)
    echo "abc123" | sudo -S perf stat -e page-faults,br_inst_retired.conditional,br_misp_retired.conditional ./test/bntest >/dev/null

    echo "abc123" | sudo -S ln -Tfs $C /usr/bin/as
    echo "abc123" | sudo -S ln -Tfs $F /usr/bin/gcc
    echo $(ls -al /usr/bin/gcc)
    echo $(ls -al /usr/bin/as)
    ./Configure > /dev/null 2>&1
    make > /dev/null 2>&1
    echo $(ls -al ./test/bntest)
    echo $(ls -al ./crypto/bn/libcrypto-shlib-bn_exp.o)
    echo "abc123" | sudo -S perf stat -e page-faults,br_inst_retired.conditional,br_misp_retired.conditional ./test/bntest >/dev/null
else
    echo "usage: ./run.sh {directory of custom gcc/as}"
fi
