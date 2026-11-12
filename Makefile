DOCKER := $(shell { command -v podman || command -v docker; })
TIMESTAMP := $(shell date -u +"%Y%m%d%H%M")
COMMIT := $(shell git rev-parse --short HEAD 2>/dev/null)
# -t only works with an attached terminal; drop it for scripted runs.
DOCKER_TTY := $(shell [ -t 0 ] && echo -it || echo -i)
BOOTLOADER_VOLUME ?= /Volumes/ADV360PRO
PROSPECTOR_VOLUME ?= /Volumes/XIAO-SENSE
ifeq ($(shell uname),Darwin)
SELINUX1 :=
SELINUX2 :=
else
SELINUX1 := :z
SELINUX2 := ,z
endif

.PHONY: all left right dongle reset-dongle image build flash-left flash-right flash-dongle flash-reset-dongle clean_firmware clean_image clean

all: BUILD_TARGETS := left right dongle
left: BUILD_TARGETS := left
right: BUILD_TARGETS := right
dongle: BUILD_TARGETS := dongle
reset-dongle: BUILD_TARGETS := reset-dongle
all left right dongle reset-dongle: build

image:
	$(DOCKER) build --tag zmk --file Dockerfile .

build: image
	bin/get_version_local.sh prospector > /dev/null
	$(DOCKER) run --rm $(DOCKER_TTY) --name zmk \
		-v $(PWD)/firmware:/app/firmware$(SELINUX1) \
		-v $(PWD)/config:/app/config:ro$(SELINUX2) \
		-e TIMESTAMP=$(TIMESTAMP) \
		-e COMMIT=$(COMMIT) \
		-e BUILD_TARGETS="$(BUILD_TARGETS)" \
		zmk; status=$$?; git checkout -- config/version.dtsi; exit $$status

flash-left: SIDE := left
flash-right: SIDE := right
flash-dongle: SIDE := dongle
flash-dongle: BOOTLOADER_VOLUME = $(PROSPECTOR_VOLUME)
flash-left flash-right flash-dongle:
	@test -d "$(BOOTLOADER_VOLUME)" || { echo "$(BOOTLOADER_VOLUME) is not mounted; put the $(SIDE) half in bootloader mode first"; exit 1; }
	@uf2=$$(ls -t firmware/*-$(SIDE)-prospector.uf2 2>/dev/null | head -n 1); \
	test -n "$$uf2" || { echo "no $(SIDE) firmware in firmware/; run make first"; exit 1; }; \
	echo "flashing $$uf2 to $(BOOTLOADER_VOLUME)"; \
	cp -X "$$uf2" "$(BOOTLOADER_VOLUME)/"

flash-reset-dongle:
	@test -d "$(PROSPECTOR_VOLUME)" || { echo "$(PROSPECTOR_VOLUME) is not mounted; double-press the Prospector reset button first"; exit 1; }
	@uf2=$$(ls -t firmware/*-dongle-reset.uf2 2>/dev/null | head -n 1); \
	test -n "$$uf2" || { echo "no dongle reset firmware in firmware/; run make reset-dongle first"; exit 1; }; \
	echo "flashing $$uf2 to $(PROSPECTOR_VOLUME)"; \
	cp -X "$$uf2" "$(PROSPECTOR_VOLUME)/"

clean_firmware:
	rm -f firmware/*.uf2

clean_image:
	$(DOCKER) image rm zmk docker.io/zmkfirmware/zmk-build-arm:stable

clean: clean_firmware clean_image
