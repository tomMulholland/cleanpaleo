#! /bin/bash

# Configuration
DB_NAME=deepdive_small2
DB_USER=czhang
DB_PASSWORD="Password is set via the PGPASSWORD environment variable"
DB_PORT=5432

cd `dirname $0`
BASE_DIR=`pwd`

dropdb -p $DB_PORT -U $DB_USER deepdive_small

createdb -p $DB_PORT -U $DB_USER deepdive_small

psql -p $DB_PORT -U $DB_USER -c "drop schema if exists public cascade; create schema public;" $DB_NAME
#

#psql -p $DB_PORT -U $DB_USER -c "delete from docids;"             $DB_NAME
#psql -p $DB_PORT -U $DB_USER -c "delete from documents;"             $DB_NAME

#psql -p $DB_PORT -U $DB_USER -c "delete from entities_candidates;"    $DB_NAME
#psql -p $DB_PORT -U $DB_USER -c "delete from entities;"             $DB_NAME

#psql -p $DB_PORT -U $DB_USER -c "delete from relation_candidates;"             $DB_NAME

#psql -p $DB_PORT -U $DB_USER -c "delete from relations_taxonomy;"             $DB_NAME
#psql -p $DB_PORT -U $DB_USER -c "delete from relations_formation;"             $DB_NAME
#psql -p $DB_PORT -U $DB_USER -c "delete from relations_formationtemporal;"             $DB_NAME
#psql -p $DB_PORT -U $DB_USER -c "delete from relations_formationlocation;"             $DB_NAME


#psql -p $DB_PORT -U $DB_USER -c "delete from relations_formationtemporal_global;"             $DB_NAME
#psql -p $DB_PORT -U $DB_USER -c "delete from relations_formationlocation_global;"             $DB_NAME


#psql -p $DB_PORT -U $DB_USER -c "delete from interval_containments;"             $DB_NAME
#psql -p $DB_PORT -U $DB_USER -c "delete from interval_not_that_possible;"             $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE docids (id bigserial primary key,   \
												  docid text,                  \
												  folder text,                 \
												  title text );"                   $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE documents (id bigserial primary key, \
											 docid  text,                           \
											 document text);"             $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE entities_candidates (id bigserial primary key, \
											 docid    text,                           \
											 entities text,
											 type     text);"             $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE entities (id   bigserial primary key, \
											 docid       text,                      \
											 type        text,                      \
											 eid         text,                      \
											 entity      text,                      \
											 author_year text,                      \
											 content     text);"                    $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE relation_candidates (id   bigserial primary key, \
											 docid  text,                  \
											 type   text,                   \
											 eid1    text,  \
											 eid2    text,  \
											 entity1 text,  \
											 entity2 text,\
											 features text,\
											 is_correct boolean);"                $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE relations_taxonomy (id   bigserial primary key, \
											 docid  text,                  \
											 type   text,                   \
											 eid1    text,  \
											 eid2    text,  \
											 entity1 text,  \
											 entity2 text,\
											 is_correct boolean);"                $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE relations_formation (id   bigserial primary key, \
											 docid  text,                  \
											 type   text,                   \
											 eid1    text,  \
											 eid2    text,  \
											 entity1 text,  \
											 entity2 text,\
											 is_correct boolean);"                $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE relations_formationtemporal (id   bigserial primary key, \
											 docid  text,                  \
											 type   text,                   \
											 eid1    text,  \
											 eid2    text,  \
											 entity1 text,  \
											 entity2 text,\
											 is_correct boolean);"                $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE relations_formationlocation (id   bigserial primary key, \
											 docid  text,                  \
											 type   text,                   \
											 eid1    text,  \
											 eid2    text,  \
											 entity1 text,  \
											 entity2 text,\
											 is_correct boolean);"                $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE relations_formationtemporal_global (id bigserial primary key, 
							entity1 text, entity2 text, is_correct boolean);" $DB_NAME

psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE relations_formationlocation_global (id bigserial primary key, 
							entity1 text, entity2 text, is_correct boolean);" $DB_NAME




psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE interval_containments (id bigserial primary key,
                                                        formation text, 
                                                        child text,
                                                        parent text);" $DB_NAME


psql -p $DB_PORT -U $DB_USER -c "CREATE TABLE interval_not_that_possible(id bigserial primary key,
                                                        formation text, 
                                                        interval1 text,
                                                        interval2 text);" $DB_NAME





