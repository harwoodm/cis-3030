#!/usr/bin/python
###########################################################################
# FILE      : type_error.py
# SUBJECT   : Demonstrates run time type errors and exceptions.
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

from sys import argv, exit

if len(argv) != 3:
    print "Usage:", argv[0], "value_1 value_2"
    exit(1)

try:
    print argv[1] + argv[2]
    print argv[1] * argv[2]

except TypeError, e:
    print "A TypeError exception:", e
