#!/usr/bin/python

from distutils.core import setup, Extension

module1 = Extension( 'spam', sources = ['spammodule.c'])

setup( name        = 'PackageName',
       version     = '1.0',
       description = 'This is a demonstration module.',
       ext_modules = [module1])
