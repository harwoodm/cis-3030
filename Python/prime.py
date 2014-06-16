#!/usr/bin/python
###########################################################################
# FILE      : prime.py
# SUBJECT   : Prime number calculator.
# PROGRAMMER: (C) Copyright 2007 by Peter C. Chapin
#
# Please send comments or bug reports to
#
#      Peter C. Chapin
#      Computer Information Systems
#      Vermont Technical College
#      Williston, VT 05495
#      PChapin@vtc.vsc.edu
###########################################################################

import sys

if len(sys.argv) != 2:
    print "Usage:", sys.argv[0], "number"
    exit(1)

number = int(sys.argv[1])

n = number / 2
while n > 1:
    if number % n == 0:
        print number, "=", n, "*", number / n
        break
    n = n - 1
else:
    print number, "is prime."
