

# to start redis, http://redis.io/topics/quickstart is your friend

import redis
locs = redis.StrictRedis(host='localhost', port=6379, db=0)
pars = redis.StrictRedis(host='localhost', port=6379, db=1)
ranks = redis.StrictRedis(host='localhost', port=6379, db=2)
id2ents = redis.StrictRedis(host='localhost', port=6379, db=3)
id2pop = redis.StrictRedis(host='localhost', port=6379, db=4)
progress = 0

import zipfile
import os

BASE_FOLDER = ".."

for _file in os.listdir(BASE_FOLDER + '/dicts'):
	if not _file.startswith('geonames'): continue
	for l in open(BASE_FOLDER + '/dicts/' + _file):
		if progress % 100000 == 0:
			print progress
		progress = progress + 1
		(id, ent, rank, names, parents) = l.rstrip('\n').split('\t')
		rank = rank
		names = names.split(',')
		parents = parents.split(',')
		names.append(ent.split('|')[0])

		added = False
		for name in names:
			name = name.lower()

			if locs.get(name) == None:
				locs.set(name, {})

			a = locs.get(name) 
			a[id] = "1"
			locs.set(name, a)
			added = True
			
		if added == True:

			id2pop.set(id, len(names))

			for p in parents:
				pars.set(id + "|" + p, "1")

			id2ents.set(id, ent)

			ranks.set(id, rank)
