NODE_BIN=./node_modules/.bin

help:
	@echo '                                                                                     		'
	@echo 'Makefile for the xqueue-watcher                                                   		'
	@echo '                                                                                     		'
	@echo 'Usage:                                                                               		'
	@echo '    make requirements                 install requirements for local development     		'
	@echo '    make test                         install requirements for local development     		'
	@echo '    make clean                        delete generated byte code and coverage reports		'
	@echo '                                                                                     		'

requirements: 
	pip install -qr requirements/production.txt --exists-action w

test.requirements: requirements
	pip install -q -r requirements/test.txt --exists-action w

test: test.requirements
	nosetests --with-coverage --cover-package=xqueue_watcher --cover-xml

clean:
	find . -name '*.pyc' -delete

# Targets in a Makefile which do not produce an output file with the same name as the target name
.PHONY: help requirements clean
