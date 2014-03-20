#! /usr/bin/env python

from helper.easierlife import *

from ext.op.superviser_occurrences import *



for row in get_inputs():

	#	log(row)

	o = {}
	for key in row:
		kk = key.split('.')[1]
		if kk != 'id' and kk != 'features':
			o[kk] = row[key]

	if o["type"] == 'FORMATION' and o["is_correct"] == False:
		o["is_correct"] = None

	print json.dumps(o)


