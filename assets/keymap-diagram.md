# Advantage 360 Pro Keymap Diagram

Custom keymap with plain Command thumb keys and a tap-toggle HYPER shortcut layer.

## Layer 0: Default (QWERTY)

```
LEFT HALF                                                              RIGHT HALF
,--------------------------------------------------.                  ,--------------------------------------------------.
|   =    |  1   |  2   |  3   |  4   |  5   | F18  |                  | MO(3)|  6   |  7   |  8   |  9   |  0   |   -    |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|  Tab   |  Q   |  W   |  E   |  R   |  T   |      |                  |  [   |  Y   |  U   |  I   |  O   |  P   |   \    |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|  Esc   |  A   |  S   |  D   |  F   |  G   |      |                  |  ]   |  H   |  J   |  K   |  L   |  ;   |   '    |
|--------+------+------+------+------+------+------'                  `------+------+------+------+------+------+--------|
| LShift |  Z   |  X   |  C   |  V   |  B   |                                |  N   |  M   |  ,   |  .   |  /   | RShift |
`--------+------+------+------+------+------'                                `------+------+------+------+------+--------'
 | MO(2) |  `   |      | Left |Right |                                              | Down |  Up  |      |      | MO(2) |
 `-------+------+------+------+------'                                               `------+------+------+------+-------'
                                            ,------+------.    ,------+------.
                                            | Alt  | Ctrl |    | RCtrl| RAlt |
                                     ,------+------+------|    |------+------+------.
                                     |      |      | Cmd  |    | Cmd  |      |      |
                                     | Bksp | Del  |      |    |      | Enter| Space|
                                     |      |      |------|    |------|      |      |
                                     |      |      |HYPER |    |HYPER |      |      |
                                     `------+------+------'    `------+------+------'
```

Thumbs: both Cmd keys send ordinary Command immediately. Tap either former Home/End key to toggle HYPER on; tap either again to return to the previous layer. Esc from HYPER switches directly to Base. With HYPER off, hold Fn before pressing those thumb keys to send Home or End. Ctrl and Alt are on the upper pair for occasional use.

## Layer 1: Keypad (toggle)

Right side converts to numpad layout. The Cmd and HYPER thumb keys retain their base-layer bindings. Toggling HYPER off returns to the keypad layer when it was already active.

```
LEFT HALF                                                              RIGHT HALF
,--------------------------------------------------.                  ,--------------------------------------------------.
|   =    |  1   |  2   |  3   |  4   |  5   | F18  |                  | MO(3)|  6   | NmLk |  =   |  /   |  *   |   -    |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|  Tab   |  Q   |  W   |  E   |  R   |  T   |      |                  |      |  Y   | KP 7 | KP 8 | KP 9 | KP - |   \    |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|  Esc   |  A   |  S   |  D   |  F   |  G   |      |                  |      |  H   | KP 4 | KP 5 | KP 6 | KP + |   '    |
|--------+------+------+------+------+------+------'                  `------+------+------+------+------+------+--------|
| LShift |  Z   |  X   |  C   |  V   |  B   |                                |  N   | KP 1 | KP 2 | KP 3 |KPEnt| RShift |
`--------+------+------+------+------+------'                                `------+------+------+------+------+--------'
 | MO(2) |  `   | Caps | Left |Right |                                              |  Up  | Down | KP . |  ]   | MO(2) |
 `-------+------+------+------+------'                                               `------+------+------+------+-------'
                                          ,-----------.    ,-----------.
                                          | Ctrl | Alt |    | GUI  | RCtrl|
                                     ,----|------|------|    |------+------+----.
                                     |    |      | Cmd  |    | Cmd  |      |     |
                                     | Bksp| Del  |------|    |------| Enter| KP 0|
                                     |    |      |HYPER |    |HYPER |      |     |
                                     `-----------+------'    `------+-----------'
```

## Layer 2: Function Keys (momentary via bottom corners)

Top row becomes F1-F12. The HYPER thumb keys send Home (left) and End (right). Other bindings pass through to the layer below, except the unused inner keys. Toggle HYPER off before using Fn.

```
LEFT HALF                                                              RIGHT HALF
,--------------------------------------------------.                  ,--------------------------------------------------.
|  F1    |  F2  |  F3  |  F4  |  F5  |  F6  | TG(1)|                  | MO(3)|  F7  |  F8  |  F9  | F10  | F11  |  F12   |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|        |      |      |      |      |      |      |                  |      |      |      |      |      |      |        |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|        |      |      |      |      |      |      |                  |      |      |      |      |      |      |        |
|--------+------+------+------+------+------+------'                  `------+------+------+------+------+------+--------|
|        |      |      |      |      |      |                                |      |      |      |      |      |        |
`--------+------+------+------+------+------'                                `------+------+------+------+------+--------'
 |       |      |      |      |      |                                              |      |      |      |      |       |
 `-------+------+------+------+------'                                               `------+------+------+------+-------'
                          (thumb HYPER keys: Home on left, End on right)
```

## Layer 3: Mod / System (momentary via top-right key)

Bluetooth profiles, bootloader, and version macro. Toggle HYPER off before using Mod. Prospector displays battery and layer status; keyboard lighting shortcuts are unassigned.

```
LEFT HALF                                                              RIGHT HALF
,--------------------------------------------------.                  ,--------------------------------------------------.
|        | BT 0 | BT 1 | BT 2 | BT 3 | BT 4 |      |                  |      |      |      |      |      |      |        |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|        |      |      |      |      |      | BOOT |                  | BOOT |      |      |      |      |      |        |
|--------+------+------+------+------+------+------|                  |------+------+------+------+------+------+--------|
|        |      |      |      |      |      |      |      |BT CLR|    |      |      |      |      |      |      |        |
|--------+------+------+------+------+------+------'                  `------+------+------+------+------+------+--------|
|        |      |      |      | VER  |      |                                |      |      |      |      |      |        |
`--------+------+------+------+------+------'                                `------+------+------+------+------+--------'
 |       |      |      |      |      |                                              |      |      |      |      |       |
 `-------+------+------+------+------'                                               `------+------+------+------+-------'
                                          ,-----------.    ,-----------.
                                          |      |      |    |      |      |
                                     ,----|------|------|    |------+------+----.
                                     |    |      |      |    |      |      |     |
                                     |    |      |------|    |------|      |     |
                                     |    |      |      |    |      |      |     |
                                     `-----------+------'    `------+-----------'
```

## Layer 4: HYPER (toggle via either former Home/End thumb key)

Tap either HYPER thumb key to activate the layer. It stays on after release and across shortcuts; tap either again to return to the previous layer. Esc switches directly to Base, clearing other active layers, without sending Escape to the Mac. Another press sends ordinary Escape. Prospector shows `HYPER` while the layer is active.

Every normal key except Esc sends its base-layout key with `Ctrl+Opt+Cmd`, including letters, numbers, punctuation, arrows, Tab, F18, Backspace, Delete, Enter, and Space. Physical Shift adds Shift. Modifier and layer-control keys retain their control roles, and unused positions remain unassigned.

### OmniWM

| Keys while HYPER is on    | Action                                        |
| ------------------------- | --------------------------------------------- |
| `H/J/K/L`                 | Focus the window left/down/up/right           |
| `Shift+H/J/K/L`           | Move the focused tile left/down/up/right      |
| `1` through `9`           | Switch to workspace 1 through 9               |
| `Shift+Q/W/E/R/T/Y/U/I/O` | Move the window to workspace 1 through 9      |
| `-` / `=`                 | Shrink / grow the focused window              |
| `Shift+F`                 | Toggle OmniWM fullscreen                      |
| `/`                       | Toggle the Dwindle split direction            |
| `,`                       | Toggle the workspace between Dwindle and Niri |

Shift is never added automatically. See `omniwm/settings.toml` in the dotfiles repo for the receiving shortcuts.

### OpenCode through Rex

Rex translates these Hyper chords into OpenCode's configured terminal shortcuts when its pane has focus:

| Keys while HYPER is on | Action                                              |
| ---------------------- | --------------------------------------------------- |
| `X`                    | Send the OpenCode leader (`Option+X`)               |
| `P`                    | Open command palette                                |
| `O`                    | Open recent sessions and projects                   |
| `T`                    | Cycle model variants                                |
| `Tab` / `Shift+Tab`    | Next / previous session tab                         |
| `R` / `D` / `F`        | Rename / delete / pin a session in the session list |
| `M`                    | Create a worktree in the move-session dialog        |

For leader sequences, press `X`, exit HYPER with Esc or a thumb key, then press the ordinary suffix. For example, `X`, Esc, `M` opens the model picker. That first Esc only changes the keyboard layer and does not cancel OpenCode's leader. Test these shortcuts at the normal prompt, where no pending question dialog is taking keyboard focus. The keyboard does not detect the focused app; the layer sends the same chords everywhere. See `rex/init.lua` and `opencode/config/cli.json.tera` in the dotfiles repo for the receiving bindings.

## Custom Behaviors

| Name         | Trigger                         | Action                                             |
| ------------ | ------------------------------- | -------------------------------------------------- |
| Homerow Mods | hold-tap (200ms, tap-preferred) | Hold for modifier, tap for key                     |
| HYPER layer  | Tap either former Home/End key  | Toggle Hyper chords; Esc switches directly to Base |
| Version      | `Mod+V` (layer 3)               | Types `YYYYMMDD-XXXX-YYYYYY` build info            |

## Custom Macros (available in keymap)

| Macro            | Output    | Description                   |
| ---------------- | --------- | ----------------------------- |
| `macro_quotes`   | `''←`     | Single quotes, cursor between |
| `macro_dquotes`  | `""←`     | Double quotes, cursor between |
| `macro_braces`   | `{}←`     | Braces, cursor between        |
| `macro_parens`   | `()←`     | Parentheses, cursor between   |
| `macro_brackets` | `[]←`     | Brackets, cursor between      |
| `macro_kinesis`  | `Kinesis` | Types "Kinesis"               |

## Legend

| Symbol        | Meaning                        |
| ------------- | ------------------------------ |
| `TG(n)`       | Toggle layer n                 |
| `MO(n)`       | Momentary layer n (while held) |
| `BOOT`        | Enter bootloader mode          |
| `BT n`        | Select Bluetooth profile n     |
| `BT CLR`      | Clear Bluetooth pairing        |
| `VER`         | Version macro                  |
| (blank)       | No binding (none)              |
| (empty in L2) | Transparent to layer below     |
