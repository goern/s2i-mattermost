
IMAGE_NAME = goern/s2i-mattermost-310-centos7

build:
	docker build --rm --tag $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
