# Advantage 360 Pro ZMK config

Personal keymap for the Kinesis Advantage 360 Pro, built locally with Docker. Forked from [KinesisCorporation/Adv360-Pro-ZMK](https://github.com/KinesisCorporation/Adv360-Pro-ZMK) (`V3.0`).

## Layout

The keymap lives in `config/adv360.keymap`; edit it by hand. `assets/keymap-diagram.md` is the human-readable version and `assets/key-positions.md` has the matrix positions needed for `hold-trigger-key-positions` and combos.

## Build

Requires Docker (or Podman) and `make`. The ZMK toolchain image is amd64 only, so on Apple Silicon it runs under emulation; the first build pulls the image and the Zephyr modules and takes a while.

```shell
make        # both halves
make left   # left half only
```

Output lands in `firmware/` as `<timestamp>-<commit>-{left,right}-clique.uf2`. The build also writes `config/version.dtsi` so `Mod+V` on the keyboard types the build date, branch, and commit.

`make clean_firmware` removes built `.uf2` files, `make clean_image` removes the Docker image, `make clean` does both.

## Flash

Each half mounts as a USB drive named `ADV360PRO` when it is in bootloader mode. The `flash-*` targets copy the newest matching `.uf2` from `firmware/` onto it.

1. Connect the left half over USB.
2. Hold `Mod` and press the top left inner key (`Mod+macro1`) to enter the bootloader. The `ADV360PRO` drive appears.
3. `make flash-left`. The drive disconnects when the copy finishes.
4. Power off both halves (unplug and switch off), then switch the left half back on.
5. Connect the right half over USB and press `Mod+macro3`.
6. `make flash-right`.
7. Unplug the right half and switch it on.

Both halves have a physical reset button that also enters the bootloader; see section 2.7 of the [user manual](https://kinesis-ergo.com/wp-content/uploads/Advantage360-ZMK-KB360-PRO-Users-Manual-v3-10-23.pdf). If a half stops pairing, flash `settings-reset.uf2` to it first, then flash the firmware again.

## Syncing upstream

```shell
git fetch https://github.com/KinesisCorporation/Adv360-Pro-ZMK.git V3.0
git merge FETCH_HEAD
```

Conflicts are normally limited to `config/adv360.keymap`: take upstream's structure and reapply the custom bindings.

## Notes

- This config builds against [Kinesis's ZMK fork](https://github.com/ReFil/zmk/tree/adv360-z3.5), pinned in `config/west.yml`. Base ZMK features can lag behind there.
- `CONFIG_BT_BAS` (battery reporting over BLE) and `CONFIG_ZMK_HID_KEYBOARD_EXTENDED_REPORT` (NKRO for F13-F24 and INTL keys) are off by default in `config/boards/arm/adv360/adv360_left_defconfig`.
- `CONFIG_ZMK_RGB_UNDERGLOW_MOD_COLOR` sets the lock indicator colour; set it in both `_defconfig` files.
