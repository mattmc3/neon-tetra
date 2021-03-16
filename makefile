.DEFAULT_GOAL := help
.PHONY: help pretty submodules

pretty:
	fish_indent -w ./**/*.fish

submodules:
	git submodule update --recursive --remote

help:
	@echo "help        Show this message"
	@echo "submodules  Update submodules"
	@echo "pretty      Run fish_indent against all fish files"
