#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Date    : 2024-11-21 15:15:51
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
    "--infile",
    dest="infile",
    type=argparse.FileType("r"),
    help="Input blast tab in blast format 7",
    required=True,
)

parser.add_argument(
    "-o",
    "--outfile",
    dest="outfile",
    type=argparse.FileType("w"),
    help="filtered blast output",
    default=sys.stdout,
)

parser.add_argument(
    "-p",
    "--percent-identity",
    dest="pi",
    type=float,
    help="Minimum percent identity",
    required=True,
)

parser.add_argument(
    "-l",
    "--alignment-length",
    dest="len",
    type=int,
    help="Minimum alignment length",
    required=True,
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

print(
    "Query",
    "Subject",
    "Percent_Identity",
    "Alignment_Length",
    sep="\t",
    file=args.outfile,
)

for line in args.infile:
    line = line.rstrip("\n")
    if not line.startswith("#"):
        tmp_list = re.split(p3, line)
        if float(tmp_list[2]) >= args.pi and int(tmp_list[3]) >= args.len:
            print("\t".join(tmp_list[:4]), file=args.outfile)

args.outfile.close()
args.infile.close()
