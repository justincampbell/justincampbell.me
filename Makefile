TEMP_DIR := tmp
RESUME := $(TEMP_DIR)/resume.md

.PHONY: build
build: clean dependencies
	hugo $(HUGO_ARGS)

.PHONY: clean
clean:
	rm -rf public/
	rm -rf $(TEMP_DIR)/
	rm -rf resources/

.PHONY: serve
serve: dependencies
	hugo serve $(HUGO_ARGS)

.PHONY: external-content
dependencies: $RESUME

$RESUME: $TEMP_DIR
	mkdir -p $(TEMP_DIR)
	curl -o $(RESUME) https://raw.githubusercontent.com/justincampbell/resume/main/JustinCampbell.md

$TEMP_DIR:
	mkdir -p $(TEMP_DIR)
