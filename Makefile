CC = gcc
SRC = src/
CFLAGS = -g -Wall -pg -Ofast -ftree-vectorize -mavx -mfpmath=sse -march=x86-64 -fno-omit-frame-pointer

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -fopenmp -o MD.exe

clean:
	rm -f ./MD.exe
	rm -f ./cp_average.txt
	rm -f ./cp_output.txt
	rm -f ./cp_traj.xyz
	rm -f ./.png
	rm -f ./.out

run: MD.exe
	perf stat -e instructions,cycles,cache-misses ./MD.exe < inputdata.txt

perf: 
	sbatch perf.sh

runn:
	sbatch run.sh
