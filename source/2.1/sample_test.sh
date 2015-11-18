#!/bin/bash

oneTimeSetUp(){
    mkdir -p ./test/
}

setUp(){
    echo "test" > ./test/test.txt
}

tearDown(){
    rm ./test/*
}

onTimeTearDown(){
    rm -rf ./test
}

testSample1(){
    cnt=`cat ./test/test.txt | wc -l`
    assertEquals ${cnt} 1

    echo "abc" >> ./test/test.txt
    cnt=`cat ./test/test.txt | wc -l`
    assertEquals ${cnt} 2
}

testSample2(){
    cnt=`cat ./test/test.txt | wc -l`
    assertEquals ${cnt} 1

    echo "abc" > ./test/test.txt
    cnt=`cat ./test/test.txt | wc -l`
    assertEquals ${cnt} 1
}

. ./src/shunit2

