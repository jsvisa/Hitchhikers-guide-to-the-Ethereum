# Commands:
#   make doctoc - generate doctoc markdown files with https://github.com/thlorenz/doctoc
#   make pretty - generate pretty markdown files with https://github.com/prettier/prettier
#   make remove - remove not used images inside `assets'
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
