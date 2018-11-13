# Commands:
#   make doctoc - generate doctoc markdown files with https://github.com/thlorenz/doctoc
#   make pretty - generate pretty markdown files with https://github.com/prettier/prettier
#   make remove - remove not used images inside `assets'
#   make optimize - optimize assets with https://tinypng.com
#

DOCTOC := $(shell command -v doctoc 2> /dev/null)
PRETTIER := $(shell command -v prettier 2> /dev/null)

.PHONY: all doctoc pretty

all: doctoc pretty

doctoc:
ifndef DOCTOC
	$(error "doctoc is not available, ref: https://github.com/thlorenz/doctoc")
endif
	find . -name "*.md" | xargs doctoc --notitle

pretty:
ifndef PRETTIER
	$(error "prettier is not available, ref: https://github.com/prettier/prettier")
endif
	find . -name "*.md" | xargs prettier --write

optimize:
ifndef TINIFY_ACCESS_KEY
	$(error "enviroment variable TINIFY_ACCESS_KEY not set, set is via https://tinypng.com/dashboard/api")
endif
	python optimize-asset.py
