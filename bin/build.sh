#!/usr/bin/env bash

set -eu

PWD=$(pwd)
TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M")}"
COMMIT="${COMMIT:-xxxxxx}"

for target in ${BUILD_TARGETS:-left right dongle}; do
	args=()
	suffix="${target}-prospector"
	case "$target" in
	left | right)
		board="adv360_${target}"
		;;
	dongle)
		board=seeeduino_xiao_ble
		args=(-DSHIELD="adv360_dongle prospector_adapter")
		;;
	reset-dongle)
		board=seeeduino_xiao_ble
		args=(-DSHIELD=settings_reset)
		suffix=dongle-reset
		;;
	*)
		echo "Unknown build target: $target" >&2
		exit 1
		;;
	esac

	west build -s zmk/app -p -d "build/${target}" -b "$board" -- \
		-DZMK_CONFIG="${PWD}/config" "${args[@]}"
	grep -vE '(^#|^$)' "build/${target}/zephyr/.config"
	cp "build/${target}/zephyr/zmk.uf2" "./firmware/${TIMESTAMP}-${COMMIT}-${suffix}.uf2"
done
