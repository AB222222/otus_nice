#!/bin/bash

#First create 2 big enough files:
dd if=/dev/urandom of=big_file_1 bs=100M count=1 iflag=fullblock
dd if=/dev/urandom of=big_file_2 bs=100M count=1 iflag=fullblock


echo -e "Starting first bzip2 ..."
date
bzip2 -9 -k big_file_1 && echo -e "End of first bzip2: " && date & 
#echo -e "Must run  meanwhile ..."
echo -e "Starting second bzip2 ..."
date
bzip2 -9 -k big_file_2 && echo -e "End of second bzip2: " && date & 
wait
echo -e "Finished all 2 processes."

rm -v big_file_1.bz2
rm -v big_file_2.bz2


echo -e "Starting first bzip2 with nice 0 ..."
date
nice -n 0 bzip2 -9 -k big_file_1 && echo -e "End of first bzip2 with nice 0: " && date & 
#echo -e "Must run  meanwhile ..."
echo -e "Starting second bzip2 with nice +19 ..."
date
nice -n 19 bzip2 -9 -k big_file_2 && echo -e "End of second bzip2 with nice +19: " && date & 
wait
echo -e "Finished all 2 processes, the second with nice +19."

rm -v big_file_1.bz2
rm -v big_file_2.bz2





