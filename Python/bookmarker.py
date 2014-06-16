#!/usr/bin/python
###########################################################################
# FILE      : bookmarker.py
# SUBJECT   : Netscape -> IE bookmark importer.
# PROGRAMMER: (C) Copyright 2002 by Peter Chapin
#
# Yes, I know that IE already can import Netscape bookmarks. The real purpose of this program is
# for learning. Anyway who knows what may become of this program some day? When you roll your
# own, the sky's the limit. :-)
#
# This script should work okay on any bookmark file that stores the entire link (from <a> to
# </a>) on a single line. To do this right it might be better to parse the HTML.
# 
# Please send comments or bug reports to
#
#      Peter Chapin
#      Computer Information Systems
#      Vermont Technical College
#      Williston, VT. 05495
#      PChapin@vtc.vsc.edu
###########################################################################

import re
import sys
import win32api
import win32con

#
# The following function processes each (title, url) pair by writing a URL file to the
# appropriate place. My handling of URL files here is pretty lame, but you have to start
# somewhere. I could see making a URL file class at some point. For now I'll just go with a
# procedural solution.
#
def process_bookmark(title, url):
    # Massage the title string a bit to be sure it's an acceptable file name.
    title = title.replace('/', '-')
    title = title.replace(':', '-')

    # Now open the output file and put the right stuff into it.
    output_file = open(favorites_folder + '\\' + title + '.url', 'w')
    output_file.write('[DEFAULT]\n')
    output_file.write('BASEURL=' + url + '\n')
    output_file.write('[InternetShortcut]\n')
    output_file.write('URL=' + url + '\n')
    output_file.close()

# ===========
# Main Script
# ===========

# Get command line arguments.
if len(sys.argv) != 2:
    print 'Usage: ' + sys.argv[0] + ' <bookmarkfile>'
    sys.exit(2)
file_name = sys.argv[1]

# Figure out where the user's Favorites are located.
key_name = \
  'Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders'
key = win32api.RegOpenKeyEx( \
  win32con.HKEY_CURRENT_USER, key_name, 0, win32con.KEY_QUERY_VALUE)
favorites_folder = win32api.RegQueryValueEx(key, 'Favorites')[0]

# Prepare regular expressions
get_urls = re.compile(r'<A.*HREF="(.*?)"')
get_title = re.compile(r'<A.*?>(.*?)</A>')

# Read the bookmark file and process each (title, url) pair encountered.
try:
    input_file = open(file_name)
    text = input_file.readlines()
    input_file.close();
    for line in text:
        url_result = get_urls.search(line)
        if url_result != None:
            title_result = get_title.search(line)
            process_bookmark(title_result.group(1), url_result.group(1))

# Handle errors generated above. This is pretty generic.
except IOError, e:
    print e

except:
    print 'Exception of unexpected type caught'
    exception_info = sys.exc_info()
    print exception_info[1]
