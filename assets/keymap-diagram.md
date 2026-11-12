# Advantage 360 Pro Keymap Diagram

Custom keymap with plain Command thumb keys and a momentary OmniWM layer.

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
                                     |      |      | WM   |    | WM   |      |      |
                                     `------+------+------'    `------+------+------'
```

Thumbs: both Cmd keys send ordinary Command immediately. Hold either former Home/End key to activate the WM layer, then release it to return to the previous layer. Hold Fn before pressing those thumb keys to send Home or End. Ctrl and Alt are on the upper pair for occasional use.

## Layer 1: Keypad (toggle)

Right side converts to numpad layout. The Cmd and WM thumb keys retain their base-layer bindings.

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
                                     |    |      | WM   |    | WM   |      |     |
                                     `-----------+------'    `------+-----------'
```

## Layer 2: Function Keys (momentary via bottom corners)

Top row becomes F1-F12. The WM thumb keys send Home (left) and End (right). Other bindings pass through to the layer below, except the unused inner keys.

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
                          (thumb WM keys: Home on left, End on right)
```

## Layer 3: Mod / System (momentary via top-right key)

Bluetooth profiles, bootloader, and version macro. Prospector displays battery and layer status; keyboard lighting shortcuts are unassigned.

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

## Layer 4: Window management (momentary via either WM thumb key)

The layer sends OmniWM's Hyper shortcuts (`Ctrl+Opt+Cmd`). Hold either WM key to activate it immediately. Its display name is `WM`.

| Keys while holding WM | Action                                        |
| --------------------- | --------------------------------------------- |
| `H/J/K/L`             | Focus the window left/down/up/right           |
| `Shift+H/J/K/L`       | Move the focused tile left/down/up/right      |
| `1` through `9`       | Switch to workspace 1 through 9               |
| `Q/W/E/R/T/Y/U/I/O`   | Move the window to workspace 1 through 9      |
| `-` / `=`             | Shrink / grow the focused window              |
| `F`                   | Toggle OmniWM fullscreen                      |
| `/`                   | Toggle the Dwindle split direction            |
| `,`                   | Toggle the workspace between Dwindle and Niri |

The workspace-move keys and `F` include Shift in their output. Physical Shift adds the move variant to `H/J/K/L`. Modifiers, layer keys, and F18 pass through; other unmapped keys do nothing. See `omniwm/settings.toml` in the dotfiles repo for the receiving shortcuts.

## Custom Behaviors

| Name         | Trigger                         | Action                                          |
| ------------ | ------------------------------- | ----------------------------------------------- |
| Homerow Mods | hold-tap (200ms, tap-preferred) | Hold for modifier, tap for key                  |
| WM layer     | Hold either WM thumb key        | Send OmniWM shortcuts until the key is released |
| Version      | `Mod+V` (layer 3)               | Types `YYYYMMDD-XXXX-YYYYYY` build info         |

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
