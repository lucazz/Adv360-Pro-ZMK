DOCKER := $(shell { command -v podman || command -v docker; })
TIMESTAMP := $(shell date -u +"%Y%m%d%H%M")
COMMIT := $(shell git rev-parse --short HEAD 2>/dev/null)
# -t only works with an attached terminal; drop it for scripted runs.
DOCKER_TTY := $(shell [ -t 0 ] && echo -it || echo -i)
BOOTLOADER_VOLUME ?= /Volumes/ADV360PRO
ifeq ($(shell uname),Darwin)
SELINUX1 :=
SELINUX2 :=
else
SELINUX1 := :z
SELINUX2 := ,z
endif

.PHONY: all left image flash-left flash-right clean_firmware clean_image clean

all: image
	$(MAKE) build BUILD_RIGHT=true

left: image
	$(MAKE) build BUILD_RIGHT=false

image:
	$(DOCKER) build --tag zmk --file Dockerfile .

.PHONY: build
build:
	bin/get_version_local.sh clique > /dev/null
	$(DOCKER) run --rm $(DOCKER_TTY) --name zmk \
		-v $(PWD)/firmware:/app/firmware$(SELINUX1) \
		-v $(PWD)/config:/app/config:ro$(SELINUX2) \
		-e TIMESTAMP=$(TIMESTAMP) \
		-e COMMIT=$(COMMIT) \
		-e BUILD_RIGHT=$(BUILD_RIGHT) \
		zmk; status=$$?; git checkout -- config/version.dtsi; exit $$status

flash-left: SIDE := left
flash-right: SIDE := right
flash-left flash-right:
	@test -d "$(BOOTLOADER_VOLUME)" || { echo "$(BOOTLOADER_VOLUME) is not mounted; put the $(SIDE) half in bootloader mode first"; exit 1; }
	@uf2=$$(ls -t firmware/*-$(SIDE)-clique.uf2 2>/dev/null | head -n 1); \
	test -n "$$uf2" || { echo "no $(SIDE) firmware in firmware/; run make first"; exit 1; }; \
	echo "flashing $$uf2 to $(BOOTLOADER_VOLUME)"; \
	cp "$$uf2" "$(BOOTLOADER_VOLUME)/"

clean_firmware:
	rm -f firmware/*.uf2

clean_image:
	$(DOCKER) image rm zmk docker.io/zmkfirmware/zmk-build-arm:stable

clean: clean_firmware clean_image
