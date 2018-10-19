PROJECT = example
VERSION = $(shell grep "ARG VERSION=" $(PROJECT)/Dockerfile | cut -d= -f2)

REGISTRY = docker.io
USER = aialferov

EDITOR = vim

IMAGE = $(REGISTRY)/$(USER)/$(PROJECT):$(VERSION)
IMAGE_LATEST = $(REGISTRY)/$(USER)/$(PROJECT):latest

BUILD_ARGS = --build-arg VERSION=$(VERSION)

USAGE_PADDING = 14

default: usage

edit:
	mkdir -p images/$(PROJECT)
	$(EDITOR) images/$(PROJECT)/Dockerfile
	rm -d images/$(PROJECT) 2>/dev/null || true

delete:
	rm images/$(PROJECT)/Dockerfile
	rm -d images/$(PROJECT) 2>/dev/null || true

list:
	@ls -1 images

build:
	docker build $(BUILD_ARGS) ./images/$(PROJECT) -t $(IMAGE)

push:
	docker push $(IMAGE)

release: local-release push
	docker push $(IMAGE_LATEST)

local-release:
	docker tag $(IMAGE) $(IMAGE_LATEST)

shell:
	docker run --rm -it --entrypoint sh $(IMAGE)

clean:
	docker system prune -f --filter label=PROJECT=$(PROJECT)

distclean: clean
	docker rmi $(IMAGE_LATEST) $(IMAGE)

login:
	docker login $(REGISTRY) --username $(USER)

logout:
	docker logout $(REGISTRY)

usage:
	@echo "Usage: make <Target> [Variables]"
	@echo
	@echo "Targets"
	@printf '$(shell printf "    %%-$(USAGE_PADDING)s %%s\\\n%.0s" {1..12})' \
	edit "Edit \"images/$(PROJECT)/Dockerfile\" with \"$(EDITOR)\"" \
	delete "Delete \"images/$(PROJECT)/Dockerfile\"" \
	list "List available Dockerfiles" \
	build "Build image \"$(IMAGE)\" from \"images/$(PROJECT)/Dockerfile\"" \
	push "Push image \"$(IMAGE)\"" \
	release "Tag \"$(IMAGE)\" as \"$(IMAGE_LATEST)\" and push both tags" \
	local-release "Tag \"$(IMAGE)\" as \"$(IMAGE_LATEST)\"" \
	shell "Run container of \"$(IMAGE)\" and exec shell in it" \
	clean "Prune everything with label \"name=$(PROJECT)\"" \
	distclean "Remove images \"$(IMAGE)\" and \"$(IMAGE_LATEST)\"" \
	login "Login to \"$(REGISTRY)\" as \"$(USER)\"" \
	logout "Logout from \"$(REGISTRY)\""
	@echo
	@echo "Variables"
	@printf '$(shell printf "    %%-$(USAGE_PADDING)s %%s\\\n%.0s" {1..5})' \
	PROJECT "Image name (current: $(PROJECT))" \
	VERSION "Image version (current: $(VERSION))" \
	REGISTRY "Docker registry (current: $(REGISTRY))" \
	USER "Docker ID (current: $(USER))" \
	EDITOR "Editor to edit a Dockerfile (current: $(EDITOR))"
