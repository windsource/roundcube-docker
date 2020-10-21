.PHONY: build push

IMAGE = windsource/roundcube
VERSION = 1.4.9-v1

build:
	docker build -t $(IMAGE):$(VERSION) -t $(IMAGE):latest .

push: build
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest