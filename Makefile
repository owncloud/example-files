SHELL := /bin/bash

app_name=$(notdir $(CURDIR))
build_dir=$(CURDIR)/build
dist_dir=$(build_dir)/dist
src_files=
src_dirs=Documents Photos
all_src=$(src_dirs) $(src_files)

.DEFAULT_GOAL := help

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##
## Build targets
##--------------------------------------

.PHONY: dist
dist:                       ## Build distribution
dist: distdir package

.PHONY: distdir
distdir:
	rm -rf $(dist_dir)
	mkdir -p $(dist_dir)/$(app_name)
	cp -R $(all_src) $(dist_dir)/$(app_name)

.PHONY: package
package:
	tar -czf $(dist_dir)/$(app_name).tar.gz -C $(dist_dir) $(app_name)
