.DEFAULT_GOAL := help

.PHONY: pretty
pretty:
	fish_indent -w ./**/*.fish

.PHONY: help
help:
	@echo "help    show this message"
	@echo "pretty  Run fish_indent against all fish files. "
