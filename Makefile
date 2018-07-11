NAME =

DOCKER_ID = aialferov
VERSION = latest

EDITOR = vim

IMAGE = $(DOCKER_ID)/$(NAME):$(VERSION)
IMAGE_LATEST = $(DOCKER_ID)/$(NAME):latest

all:
	@echo "Usage: make <COMMAND> NAME=<name> [OPTIONS]"
	@echo
	@echo "COMMANDS"
	@echo "    build"
	@echo "    push"
	@echo "    list"
	@echo "    run"
	@echo "    login"
	@echo "    logout"
	@echo
	@echo "OPTIONS"
	@echo "    DOCKER_ID=<docker_id> (default: $(DOCKER_ID))"
	@echo "    VERSION=<version> (default: $(VERSION))"

edit:
	mkdir -p $(NAME)
	$(EDITOR) $(NAME)/Dockerfile
	rm -d $(NAME) 2>/dev/null || true

delete:
	rm $(NAME)/Dockerfile
	rm -d $(NAME) 2>/dev/null || true

build:
	docker build ./$(NAME) -t $(IMAGE)
	docker tag $(IMAGE) $(IMAGE_LATEST)

push:
	docker push $(IMAGE)
	docker push $(IMAGE_LATEST)

list:
	@ls -1 | \
		grep -v Makefile | \
		grep -v README.md | \
		grep -v LICENSE.md

run:
	docker run --rm -it $(IMAGE) $(CMD)

login:
	docker login --username $(DOCKER_ID)

logout:
	docker logout

clean:
	docker rmi $(IMAGE)
