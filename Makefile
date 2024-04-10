PY ?= python
POETRY ?= poetry
PIP ?= pip

build-FastAPILayer:
	mkdir -p "$(ARTIFACTS_DIR)/python"
	$(POETRY) export --only=fastapi --format=requirements.txt > $(ARTIFACTS_DIR)/requirements.txt
	$(PY) -m $(PIP) install -r $(ARTIFACTS_DIR)/requirements.txt -t "$(ARTIFACTS_DIR)/python" \
		--implementation cp --platform manylinux2014_x86_64 --only-binary=:all: --
	rm $(ARTIFACTS_DIR)/requirements.txt