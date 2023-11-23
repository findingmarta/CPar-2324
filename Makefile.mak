CC = gcc
SRC = src/
CFLAGS = -Ofast -pg -g -fno-omit-frame-pointer

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
    $(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
    rm -f ./MD.exe
    rm -f ./cp_average.txt
    rm -f ./cp_output.txt
    rm -f ./cp_traj.xyz
    rm -f ./.png
    rm -f ./.out

run: MD.exe
    perf stat -e instructions,cycles,cache-misses ./MD.exe < inputdata.txt