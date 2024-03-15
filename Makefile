.PHONY: test
test:
	pytest -v --cov=. --cov-config=.coveragerc --cov-fail-under=80 --cov-report term-missing

.PHONY: clean
clean:
	rm -rf .pytest_cache .coverage __pycache__

.PHONY: lint
lint:
	pylint --rcfile=.pylintrc --fail-under=9.0 *.py
	# stop the build if there are Python syntax errors or undefined names
	flake8 . --count --select=E9,F63,F7,F82 --exclude .venv --show-source --statistics
	# exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
	flake8 . --count --exclude .venv --exit-zero --max-complexity=10 --max-line-length=127 --statistics
	black .
