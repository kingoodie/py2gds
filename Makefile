SHELL:=/usr/bin/env bash

.PHONY: lint
lint:
	poetry run mypy py2gds
	poetry run flake8 .
	poetry run autopep8 -r . --diff --exclude=./tests/fixtures/** --exit-code
	poetry run lint-imports
	poetry run doc8 -q docs

.PHONY: unit
unit:
	poetry run pytest

.PHONY: package
package:
	poetry run poetry check
	poetry run pip check
	poetry run safety check --bare --full-report

.PHONY: test
test: unit package