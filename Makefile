src_dir := algebra

virtualenv_dir := pyenv
pip := $(virtualenv_dir)/bin/pip
pytest := $(virtualenv_dir)/bin/py.test
coverage := $(virtualenv_dir)/bin/coverage


test: $(virtualenv_dir)
	# We set PYTHONPATH, so that when running tests python could find the
	# location of 'algebra' module.
	PYTHONPATH=$(PYTHONPATH):. $(coverage) run \
		--source $(src_dir) $(pytest) -s tests
	$(coverage) report -m
.PHONY: test

$(virtualenv_dir): requirements.txt
	virtualenv $@
	$(pip) install -r $^
