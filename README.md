# Advantage 360 Pro ZMK config

Personal keymap for the Kinesis Advantage 360 Pro, built locally with Docker. Forked from [KinesisCorporation/Adv360-Pro-ZMK](https://github.com/KinesisCorporation/Adv360-Pro-ZMK) (`V3.0`).

## Connection

Both keyboard halves connect over Bluetooth to a [Prospector](https://github.com/carrefinho/prospector), which connects to the Mac over USB. Prospector runs the keymap and displays the highest active layer, each half's battery level, and connection status. The halves require the dongle with this firmware; neither half acts as a standalone USB or Bluetooth keyboard.

The receiver uses a Seeed XIAO nRF52840 Sense and the Zephyr 3.5-compatible [Prospector module](https://github.com/carrefinho/prospector-zmk-module). Its revision is pinned in `config/west.yml`. Display brightness is fixed at 50%; change `config/adv360_dongle.conf` to adjust it or enable the optional ambient-light sensor.

## Layout

The keymap lives in `config/adv360.keymap`; edit it by hand. `assets/keymap-diagram.md` is the human-readable version and `assets/key-positions.md` has the matrix positions needed for `hold-trigger-key-positions` and combos.

Both Cmd thumb keys send ordinary Command. Tap either former Home/End thumb key to toggle the `HYPER` layer on. It stays active after release and across shortcuts; tap either thumb key again to return to the previous layer. Esc switches directly to Base, clearing other active layers, and does not send Escape to the Mac on that press. Another press sends ordinary Escape. Prospector shows `HYPER` while it is active.

In HYPER, every normal key except Esc sends its base-layout key with `Ctrl+Opt+Cmd`. Physical Shift adds Shift: tap HYPER, then press `Shift+H/J/K/L` to send `Hyper+Shift+H/J/K/L`. Workspace moves use `Shift+Q/W/E/R/T/Y/U/I/O`, and fullscreen uses `Shift+F`. The layer also reaches Rex's OpenCode shortcuts, such as `X` for the leader, `P` for commands, and `O` for recent sessions. After `X`, exit HYPER with Esc or a thumb key before the unmodified leader suffix, such as `M` for models.

Toggle HYPER off before using Fn or Mod. Hold Fn first, then press the former Home/End thumb keys to send Home or End. Ordinary key presses carry the Hyper chord only while HYPER is active; modifier and layer-control keys retain their control roles.

All three devices share `adv360-layouts.dtsi` and `adv360-transform.dtsi`. The right half adds its column offset locally. Keyboard lighting retains the halves' startup settings, but the Mod-layer lighting shortcuts are removed: the Kinesis lighting implementation assumes a central keyboard half and one peripheral. Use Prospector for layer and battery status.

## Build

Requires Docker (or Podman) and `make`. The ZMK toolchain image is amd64 only, so on Apple Silicon it runs under emulation; the first build pulls the image and the Zephyr modules and takes a while.

```shell
make                # both peripheral halves and Prospector
make left           # left peripheral only
make right          # right peripheral only
make dongle         # Prospector only, including keymap changes
make reset-dongle   # settings-reset firmware for the XIAO
```

Output lands in `firmware/` as `<timestamp>-<commit>-{left,right,dongle}-prospector.uf2`. The receiver reset image ends in `-dongle-reset.uf2`. The build also writes `config/version.dtsi` so `Mod+V` on the keyboard types the build date, branch, commit, and `prospector` suffix.

`make clean_firmware` removes built `.uf2` files, `make clean_image` removes the Docker image, `make clean` does both.

## First flash and pairing

Each half mounts as `ADV360PRO` in bootloader mode. Double-pressing Prospector's reset button mounts it as `XIAO-SENSE`. The `flash-*` targets copy the newest matching image from `firmware/`. Override `BOOTLOADER_VOLUME` or `PROSPECTOR_VOLUME` if a drive has a different mount path.

Changing the central requires clearing old Bluetooth bonds on all three devices. Build the normal images and `make reset-dongle` first. One USB port is enough: Prospector can stay unplugged while flashing the halves.

1. Unplug both keyboard halves and switch them off.
2. Double-press Prospector's reset button. Run `make flash-reset-dongle` and let the reset firmware boot.
3. Double-press reset again, then run `make flash-dongle`. Unplug Prospector if you need its USB port for the halves.
4. Connect the left half over USB and use its physical reset button to enter bootloader mode. Use Finder to copy the repository's `settings-reset.uf2` to `ADV360PRO` and let it boot.
5. Put the left half back in bootloader mode and run `make flash-left`. Switch it off and unplug it after flashing.
6. Connect the right half over USB. Repeat the reset-image procedure, then enter bootloader mode again and run `make flash-right`. Switch it off and unplug it after flashing.
7. Reconnect Prospector to the Mac. Switch the left half on and wait for its connection indicator, then switch the right half on. Both halves run wirelessly on battery.

Pair the left half first: the Prospector battery widgets follow pairing order. The repository's `settings-reset.uf2` is for the Advantage 360 halves; the XIAO uses the separately built `-dongle-reset.uf2` image.

For the halves' physical reset buttons, see section 2.7 of the [user manual](https://kinesis-ergo.com/wp-content/uploads/Advantage360-ZMK-KB360-PRO-Users-Manual-v3-10-23.pdf).

## Later updates

For ordinary keymap changes, build and flash the dongle. Rebuild and flash all three devices after changes to the layout, split configuration, behavior definitions, or ZMK revision. Normal firmware updates retain pairing.

Once paired, `Mod+macro1` enters the left half's bootloader and `Mod+macro3` enters the right half's bootloader. Use Prospector's physical reset button for the receiver.

To return to the original left-central arrangement, rebuild the two halves from the pre-Prospector revision (`2af2a6b`), clear their bonds, flash those images, and pair the keyboard with the Mac again.

## Hardware checks

- Type from both halves through Prospector and check both connection/battery widgets.
- Tap either former Home/End thumb key and check that the display stays on `HYPER` after release and multiple shortcuts. Check that either thumb key returns to the previous layer and Esc returns directly to Base. Confirm the first Esc only changes layers and a second sends ordinary Escape.
- Check window focus with `H/J/K/L`, moves with `Shift+H/J/K/L`, workspace switching with `1` through `9`, workspace moves with `Shift+Q/W/E/R/T/Y/U/I/O`, and fullscreen with `Shift+F`.
- In OpenCode through Rex at the normal prompt, check `P` for commands, `O` for recent sessions, and `X`, Esc, then `M` for models. Confirm ordinary typing resumes with no stuck modifiers after exiting HYPER.
- Hold Cmd longer than 300 ms before a normal shortcut, including `Cmd+Shift+3/4/5`.
- Check Fn+thumb Home/End and F18 in Hex with HYPER off. From the keypad layer, check that toggling HYPER off with a thumb returns to Keypad, while Esc from HYPER returns to Base.

## Syncing upstream

```shell
git fetch https://github.com/KinesisCorporation/Adv360-Pro-ZMK.git V3.0
git merge FETCH_HEAD
```

Review upstream changes to the keymap and board definitions against the dongle setup, especially the shared physical layout and matrix transform.

## Notes

- This config builds against [Kinesis's ZMK fork](https://github.com/ReFil/zmk/tree/adv360-z3.5), pinned in `config/west.yml`. Base ZMK features can lag behind there.
- `config/adv360_left.conf` and `config/adv360_right.conf` set peripheral roles and enable battery reporting to Prospector.
- The dongle enables extended NKRO reporting so F18 reaches the Mac.
