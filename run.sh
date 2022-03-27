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
    ./Configure --prefix=/home/jh/Desktop/openssl_frkd --openssldir=/home/jh/Desktop/openssl_frkd -Wl,-rpath,/home/jh/Desktop/openssl_frkd
    make
    echo "abc123" | sudo -S perf stat -o result_aligned.txt -e page-faults,br_inst_retired.conditional,br_misp_retired.conditional ./test/bntest >/dev/null
    echo "abc123" | sudo -S echo $(ls -al ./test/bntest) >> result_aligned.txt
    echo "abc123" | sudo -S echo $(ls -al ./crypto/bn/libcrypto-shlib-bn_exp.o) >> result_aligned.txt


    echo "abc123" | sudo -S ln -Tfs $C /usr/bin/as
    echo "abc123" | sudo -S ln -Tfs $F /usr/bin/gcc
    echo $(ls -al /usr/bin/gcc)
    echo $(ls -al /usr/bin/as)
    ./Configure --prefix=/home/jh/Desktop/openssl_frkd --openssldir=/home/jh/Desktop/openssl_frkd -Wl,-rpath,/home/jh/Desktop/openssl_frkd
    make
    echo "abc123" | sudo -S perf stat -o result_raw.txt -e page-faults,br_inst_retired.conditional,br_misp_retired.conditional ./test/bntest >/dev/null
    echo "abc123" | sudo -S echo $(ls -al ./test/bntest) >> result_raw.txt
    echo "abc123" | sudo -S echo $(ls -al ./crypto/bn/libcrypto-shlib-bn_exp.o) >> result_raw.txt
else
    echo "usage: ./run.sh {directory of custom gcc/as}"
fi
