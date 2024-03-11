# "Glorious Engrammer" keymap for MoErgo Glove80

This is [my Glove80][1] keymap featuring the [Engram][2]/[mer][3]
layouts with [Miryoku][4]-style layers and [home row mods][5].
Other layouts (QWERTY, Dvorak, Colemak/DH, etc.) and
familiar keys (arrows, pinky shifts, function row)
are also provided as "training wheels" to aid your
transition to the full glory, at your convenience.

>![Photograph of my Glove80 with Engrammer layout](https://raw.githubusercontent.com/sunaku/sunaku.github.io/master/moergo-glove80-keyboard-photograph.jpg)

[1]: https://sunaku.github.io/moergo-glove80-keyboard.html
[2]: https://sunaku.github.io/engram-keyboard-layout.html
[3]: https://sunaku.github.io/engrammer-keyboard-layout.html
[4]: https://github.com/manna-harbour/miryoku
[5]: https://sunaku.github.io/home-row-mods.html

<!-- vim-markdown-toc GFM -->

* [Keymap](#keymap)
    * [Legend](#legend)
* [Guide](#guide)
    * [Factory layout](#factory-layout)
    * [Operating system](#operating-system)
    * [Home row mods](#home-row-mods)
        * [One-shot shifts](#one-shot-shifts)
    * [Layer access keys](#layer-access-keys)
    * [Key auto-repeat](#key-auto-repeat)
    * [Alpha layouts](#alpha-layouts)
    * [Unicode and Emoji](#unicode-and-emoji)
* [Installing](#installing)
    * [Flashing](#flashing)
* [Upgrading](#upgrading)
* [Customizing](#customizing)
    * [Overriding the defaults](#overriding-the-defaults)
        * [Reordering home row mods](#reordering-home-row-mods)
        * [Fine-tuning the timing](#fine-tuning-the-timing)
    * [Compiling from source](#compiling-from-source)
        * [Unicode/Emoji characters](#unicodeemoji-characters)
        * [Rearranging the base layer](#rearranging-the-base-layer)
* [Discussion](#discussion)
* [License](#license)

<!-- vim-markdown-toc -->

## Keymap

- https://my.glove80.com/#/layout/user/05c7da03-20bd-494e-a795-d382a5a96621

### Legend

See [interactive layer map][6] for overview and documentation.
>NOTE: This is also available as a [printable PDF document][7].

See [release notes][8] for a visual overview of recent updates.

[6]: https://sunaku.github.io/moergo-glove80-keyboard.html#layers
[7]: https://sunaku.github.io/moergo-glove80-keyboard-layers.pdf
[8]: https://github.com/sunaku/glove80-keymaps/releases

[![Base layer](README/base-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#layers)
[![Lower layer](README/lower-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#lower-layer)
[![Cursor layer](README/cursor-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#cursor-layer)
[![Number layer](README/number-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#number-layer)
[![Function layer](README/function-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#function-layer)
[![Emoji layer](README/emoji-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#emoji-layer)
[![Symbol layer](README/symbol-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#symbol-layer)
[![Mouse layer](README/mouse-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#mouse-layer)
[![System layer](README/system-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#system-layer)
[![World layer](README/world-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#world-layer)
[![Typing layer](README/typing-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#typing-layer)
[![Gaming layer](README/gaming-layer-diagram.png)](https://sunaku.github.io/moergo-glove80-keyboard.html#gaming-layer)

## Guide

Welcome to the *Glorious Engrammer* keymap! 🧑‍🚀🚀✨  This introductory
guide will orient you to the world of custom layouts, keymaps, and firmware. 💁

### Factory layout

Before we get started, let's talk about your escape route back to familiarity.

If you're a new user (perhaps you've just unboxed your Glove80 or you haven't
customized its default keymap), you might find the Factory layer to be useful:

1. Press & hold the Magic key (bottom left corner key on left half of Glove80)
2. Tap the left hand's T3 key (furthest key on the upper arc of thumb cluster)

This shortcut will toggle the Factory layer on/off and allow you to experiment
with this keymap while maintaining an easy escape route to the factory default.

### Operating system

First, let's configure this keymap to better suit your operating system by
adding one of the following lines (just copy+paste whichever is appropriate)
atop the "Custom Defined Behaviors" text box in your clone of this keymap:

```dts
#define OPERATING_SYSTEM 'L' // Linux
#define OPERATING_SYSTEM 'M' // macOS
#define OPERATING_SYSTEM 'W' // Windows
```

### Home row mods

Next, let's become familiar with the powerful concept of [home row mods][HRM],
which are dual-function keys that send normal keycodes (such as the letter `A`
or the number `1`) when tapped or modifiers (such as Shift or Ctrl) when held.

![Concept diagram of *home row mods* on a row-staggered keyboard][HRM_diagram]

[HRM]:         https://sunaku.github.io/home-row-mods.html
[HRM_diagram]: https://sunaku.github.io/home-row-mods.png

The diagram above shows the default "GACS" order of home row mods in this keymap:
- "G" means `LGUI`, which is the Win key in Windows, Cmd in macOS, Super in Linux.
- "A" means `LALT`, which is the Alt key in Windows and Linux, Option in macOS.
- "C" means `LCTL`, which is the Control key in Windows, macOS, and Linux alike.
- "S" means `LSFT`, which is the Shift key in Windows, macOS, and Linux alike.

**NOTE:** If you set your operating system to macOS in the preceding section,
the home row mods order will be automatically rearranged into "CAGS" because
macOS shortcuts tend to use the Cmd key like Windows/Linux use the Ctrl key.

#### One-shot shifts

The Lower keys on the base layer provide one-shot sticky shift functionality,
whereby tapping them temporarily activates a sticky Shift that applies itself
to the next key you tap.  This can be useful for single letter capitalization,
such as for the frequent "I" in English or when typing camel/PascalCase names.

### Layer access keys

This keymap borrows heavily from the [legendary Miryoku][4] system, featuring:

- Six specialized layers: Cursor, Number, Function, Symbol, Mouse, System
- Layer access via thumb keys: Backspace, Delete, Escape, Enter, Tab, Space
- Home row mods on the base layer and on same-hand of all layer access keys

The idea is that you can always access modifiers with the same hand as the
layer access key (which your thumb is holding down) to modify keystrokes on
that respective layer.  This way, you don't need to lift your hands off the
keyboard or your fingers away from their home position to execute shortcuts.

### Key auto-repeat

Since dual-function keys (such as home row mods and layer access keys) have a
special effect when held, they won't auto-repeat when held like a normal key.
Instead, you have two options for engaging auto-repeat on dual-function keys:

1. Use the "Tap then hold" method: first tap (press and release) and then hold
   (press and don't release until the desired amount of repetition is reached).

2. Using repetition access keys: first hold a `&plain` layer access key and
   then hold the key you want to repeat for the desired amount of repetition.

![Using repetition access keys](https://github.com/sunaku/glove80-keymaps/assets/9863/de0078c5-eeda-40fc-8c5b-39b7c0338cdc)

### Alpha layouts

This keymap lets you dynamically switch to alpha layouts (such as QWERTY and
Dvorak) other than the one you chose for your base layer during installation,
by holding the Magic key and tapping the respective number key for that layer.

| Shortcut  | Layer number | Alpha layout                        |
| --------- | ------------ | ----------------------------------- |
| Magic+`=` | 0            | Engrammer (base layer; your choice) |
| Magic+`1` | 1            | Engram                              |
| Magic+`2` | 2            | Dvorak                              |
| Magic+`3` | 3            | ColemakDHm                          |
| Magic+`4` | 4            | Colemak                             |
| Magic+`5` | 5            | QWERTY                              |
| Magic+`6` | 6            | Norman                              |
| Magic+`7` | 7            | Workman                             |
| Magic+`8` | 8            | Halmak                              |

For the first 5 alpha layouts, the respective number key for each layout will
illuminate when you tap the Magic key.  For example, suppose that we activate
the QWERTY layout by typing Magic+`5` and that we've forgotten about it after
some time... 😅 how can we know which alpha layout is currently active?  Well,
by simply tapping the Magic key, we'll see that number 5 illuminates in pink 🚨
thereby indicating that the QWERTY alpha layout (at layer number 5) is active.

However, note that number row illumination isn't available for layer 6 onwards.
That's just how the Glove80's firmware is currently implemented today; you have
the option of implementing such enhancements by editing its ZMK code if desired.

### Unicode and Emoji

Unicode characters (including Emoji 🔥) are typed through ZMK macros (sequences
of multiple keystrokes) generated from the `world.yaml` and `emoji.yaml` files
by the `rake` command.  However, in order for these macros to take effect, you
may need to enable support for Unicode hexadecimal character input in your OS:

- (macOS) https://sevenseacat.net/posts/2018/unicode-in-qmk-on-osx/
- (Linux) https://help.ubuntu.com/stable/ubuntu-help/tips-specialchars.html.en#ctrlshiftu
- (Windows) https://github.com/samhocevar/wincompose

Specifically, Windows users need to be running the WinCompose tool linked above.

## Installing

Open the [keymap link above](#keymap) and follow these instructions:
1. Log in (account is required)
2. Clone the keymap to customize and/or build it!
3. Choose your base layout (place at top as layer number #0) via drag & drop.
4. Customize the keymap behavior in this text box.
5. Build the firmware and download the `*.uf2` file.

![instructions](https://github.com/sunaku/glove80-keymaps/assets/9863/4eeafe4c-0ab3-4900-b241-f62b0467a394)

### Flashing

- For the initial flash, follow "Loading new ZMK firmware onto your Glove80"
(see page 28 of the [Glove80 User Guide]) or, if that doesn't work, try the
"bootloader mass storage device mode" method (see page 31 in the user guide).

- If you're installing a different firmware version compared to what your
keyboard currently has, then ⚠️ **after flashing both halves** ⚠️ perform a
"Configuration Factory Reset" on both halves (see page 41 in the [Glove80 User
Guide]) and then turn RGB effects on, watch them illuminate, and finally turn
them back off.  This allows the newly installed firmware to take full effect.

[Glove80 User Guide]: https://www.moergo.com/files/glove80-user-guide.pdf

## Upgrading

- Copy the ZMK snippet from the "Custom Defined Behaviors" text box in either
keymap linked above and paste into yours.  The contents of that text box are
also available in the `*.dtsi` files provided in this Git repository.

- You can diff and copy changes between a JSON export of your keymap (via
"Advanced Settings" > "Enable local config" then go back to "Edit" and click
"Download") and the `*.json` files provided in this Git repository.

## Customizing

### Overriding the defaults

You can override the various `#define` settings that govern this keymap by
adding them above the snippet in the "Custom Defined Behaviors" text box:

```dts
// add your overrides here, up at the very top:
#define OPERATING_SYSTEM 'W' // windows
#define EMOJI_HAIR_STYLE_PRESET 'C' // curly_hair

// ... rest of snippet goes here, unchanged ...
```

For your reference, the following diagram shows the default values for all
settings and how they inherit from each other, so you can override them
together as a group (by inheritance) or each individually (fine-grained).

<details>
  <summary><b>Diagram:</b> Default values for #define settings</summary>

  ![diagram](define.svg)

</details>

#### Reordering home row mods

The `*_FINGER_MOD` settings specify which modifiers are used by home row mod
keys. Miryoku's "GACS" (Win, Alt, Ctrl, Shift) order is the default -- unless
you set `OPERATING_SYSTEM` to macOS, in which case Win and Ctrl are swapped.

```dts
#define PINKY_FINGER_MOD LGUI
#define RING1_FINGER_MOD LALT
#define RING2_FINGER_MOD RALT
#define MIDDY_FINGER_MOD LCTL
#define INDEX_FINGER_MOD LSFT
```

The above settings mirror finger-mod assignments across both hands, but you can
also make them different through the following additional settings if you want:

```dts
#define LEFT_PINKY_MOD  RALT
#define RIGHT_PINKY_MOD LCTL
```

#### Fine-tuning the timing

Activate the typing layer, launch the [QMK Configurator's testing tool](
https://config.qmk.fm/#/test ), and then pretend to use home row mods. Note the
timing and duration of keystrokes reported by the tool and then use them to
adjust the `#define` time thresholds in the "Custom Defined Behaviors" snippet.

### Compiling from source

1. Clone or download a copy of this Git repository (if you haven't already).

2. Install dependencies OR skip this step if you have Docker on your system:

       apt install rake graphviz

3. In your copy of this repository, run `rake` OR `./rake` if using Docker.

#### Unicode/Emoji characters

You can customize the preset characters in the Emoji and World layers by
editing their respective YAML source files in this repository.  Afterwards,
run the `rake` command and then copy the new `keymap.dtsi` contents back into
the "Custom Defined Behaviors" text box in the Layout Editor for your keymap.

#### Rearranging the base layer

If you rearrange the base layer (say, for a custom or alternative layout) then:

1. Export your keymap as a JSON file (via "Advanced Settings" > "Enable local
   config" then go back to "Edit" and click "Download") in the Layout Editor.
   ![Enable local config](https://github.com/sunaku/glove80-keymaps/assets/9863/5bf7ff67-94bc-4d8e-9673-271863966dd2)
   ![Download JSON export](https://github.com/sunaku/glove80-keymaps/assets/9863/a7ad7155-e0e6-47e1-ad4c-c89b4d8521b9)

2. Overwrite the `keymap.json` file in this repository with your exported file.

3. Run the `rake` command in this repository.

4. Copy the new `keymap.dtsi` contents back into the "Custom Defined Behaviors"
   text box in the Layout Editor for your keymap.

You don't need to change the per-finger layers (such as "LeftPinky") manually.

## Discussion

Join the [`#glorious-engrammer`][9] channel on [MoErgo's discord server][10].

[9]: https://discord.com/channels/877392805654306816/1111469812850380831
[10]: https://www.moergo.com/discord

## License

[Spare A Life]: https://sunaku.github.io/vegan-for-life.html
> Like my work? 👍 Please [spare a life] today as thanks! 🐄🐖🐑🐔🐣🐟✨🙊✌  
> Why? For 💕 ethics, the 🌎 environment, and 💪 health; see link above. 🙇

(the ISC license)

Copyright 2023 Suraj N. Kurapati <https://github.com/sunaku>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
