#!/bin/bash
whoami
scp -o ConnectTimeout=10 -o ServerAliveInterval=5 -o ServerAliveCountMax=3 src/cat/s21_cat src/grep/s21_grep claralad@10.0.2.254:/usr/local/bin
