all: push

JAVA_VERSION = 8
JAVA_UPDATE = 102
JAVA_BUILD = 14

BUILD_DATE = $(shell date +"%Y%m%d")

TAG = $(JAVA_VERSION)-$(BUILD_DATE)
PREFIX = quay.io/widen/java-firefox

build:
	docker build --pull -t $(PREFIX):$(TAG) .

tag: build
	docker tag $(PREFIX):$(TAG) $(PREFIX):$(JAVA_VERSION)
	docker tag $(PREFIX):$(TAG) $(PREFIX):$(JAVA_VERSION)u$(JAVA_UPDATE)

push: tag
	docker push $(PREFIX):$(TAG)
	docker push $(PREFIX):$(JAVA_VERSION)
	docker push $(PREFIX):$(JAVA_VERSION)u$(JAVA_UPDATE)

clean:
	docker rmi -f $(PREFIX):$(TAG) || true
	docker rmi -f $(PREFIX):$(JAVA_VERSION) || true
	docker rmi -f $(PREFIX):$(JAVA_VERSION)u$(JAVA_UPDATE) || true
