#! /usr/bin/env python

from helper.easierlife import *

import os

for f in os.listdir(BASE_FOLDER + "/tmp/"):
	if f.endswith('rel'):
		for l in open(BASE_FOLDER + "/tmp/" + f):
			print l.rstrip()