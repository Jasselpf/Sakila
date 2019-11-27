CWD=$(shell pwd)
PKG=sakila

clean:
	find ./$(PKG) -name "*.pyc" -exec rm -rfv {} \;

test:
	tox -r

.PHONY: test clean
