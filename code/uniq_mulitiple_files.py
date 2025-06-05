#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Date    : 2025-01-07 15:33:03
# @Author  : Lokesh Mano (lokeshwaran.manoharan@nbis.se)
# @Link    : link
# @Version : 1.0.0

import os
import re
import sys
import copy
import argparse

usage = """Insert usage here"""

parser = argparse.ArgumentParser(description=usage)


parser.add_argument(
    "-i",
    "--indir",
    dest="indir",
    type=str,
    help="Input directory of all the input files",
    required=True,
)

parser.add_argument(
    "-o",
    "--outfile",
    dest="outfile",
    type=argparse.FileType("w"),
    help="Final unique file",
    default=sys.stdout,
)

args = parser.parse_args()

p0 = re.compile(">")
p1 = re.compile(" ")
p2 = re.compile("\,")
p3 = re.compile("\t")
p4 = re.compile("\;")

"""
Insert Block comment here
"""

files_dir = {}
probe_seq = {}

files_in_dir = {
    key: 0 for key in os.listdir(args.indir) if os.path.abspath(key).endswith(".txt")
}

for file in files_in_dir:
    input_file = open(os.path.join(os.getcwd(), args.indir, file), "r")
    for line in input_file:
        line = line.rstrip().upper()
        probe_seq[line] = 1
    input_file.close()

for seq in probe_seq.keys():
    print(seq, file=args.outfile)

args.outfile.close()
