# "Glorious Engrammer" keymap for MoErgo Glove80

This is [my Glove80] keymap featuring the [Engram] and [Engrammer] layouts with
[Miryoku]-style layers and [home row mods].  Other layouts (**QWERTY**, Dvorak,
Colemak/DH, etc.) and familiar keys (arrows, pinky shifts, function row) are
also provided as "training wheels" to aid your transition to the full glory.

[my Glove80]:    https://sunaku.github.io/moergo-glove80-keyboard.html
[Engram]:        https://sunaku.github.io/engram-keyboard-layout.html
[Engrammer]:     https://sunaku.github.io/engrammer-keyboard-layout.html
[Miryoku]:       https://github.com/manna-harbour/miryoku
[home row mods]: https://sunaku.github.io/home-row-mods.html

## Keymap

Version 37 (2024-09-15)
- Changes: https://github.com/sunaku/glove80-keymaps/releases/v37
- Release: https://my.glove80.com/#/layout/user/13c16910-9689-4408-a392-39a6e0e15162

### Legend

See [interactive layer map][map] for overview and documentation.
>NOTE: This is also available as a [printable PDF document][pdf].

See [release notes][rel] for a visual overview of recent updates.

[map]: https://sunaku.github.io/moergo-glove80-keyboard.html#layers
[pdf]: https://sunaku.github.io/moergo-glove80-keyboard-layers.pdf
[rel]: https://github.com/sunaku/glove80-keymaps/releases

### Contents

<!-- vim-markdown-toc GFM -->

* [Guide](#guide)
    * [Factory layout](#factory-layout)
    * [Operating system](#operating-system)
    * [Home row mods](#home-row-mods)
        * [Difficulty level](#difficulty-level)
        * [One-shot shifts](#one-shot-shifts)
        * [Bilateral combinations](#bilateral-combinations)
    * [Layer access keys](#layer-access-keys)
    * [Key auto-repeat](#key-auto-repeat)
    * [Alpha layouts](#alpha-layouts)
    * [Unicode and Emoji](#unicode-and-emoji)
        * [OS-native compose](#os-native-compose)
* [Installing](#installing)
    * [Enabling mouse emulation](#enabling-mouse-emulation)
    * [Flashing](#flashing)
* [Upgrading](#upgrading)
* [Customizing](#customizing)
    * [Overriding the defaults](#overriding-the-defaults)
        * [Reordering home row mods](#reordering-home-row-mods)
        * [Fine-tuning the timing](#fine-tuning-the-timing)
    * [Compiling from source](#compiling-from-source)
        * [Unicode/Emoji characters](#unicodeemoji-characters)
            * [Adding a new Emoji character](#adding-a-new-emoji-character)
        * [Rearranging the base layer](#rearranging-the-base-layer)
* [Discussion](#discussion)
* [License](#license)

<!-- vim-markdown-toc -->

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

```h
#define OPERATING_SYSTEM 'L' // Linux
#define OPERATING_SYSTEM 'M' // macOS
#define OPERATING_SYSTEM 'W' // Windows
```

### Home row mods

Next, let's become familiar with the concept of [home row mods], which are
dual-function keys that *either* send normal keycodes (such as the letter `A`
or the number `1`) when tapped or modifiers (such as Shift or Ctrl) when held.

![Concept diagram of *home row mods* on a row-staggered keyboard](https://sunaku.github.io/home-row-mods.png)

The diagram above shows the default "GACS" order of home row mods in this keymap:
- "G" means `LGUI`, which is the Win key in Windows, Cmd in macOS, Super in Linux.
- "A" means `LALT`, which is the Alt key in Windows and Linux, Option in macOS.
- "C" means `LCTL`, which is the Control key in Windows, macOS, and Linux alike.
- "S" means `LSFT`, which is the Shift key in Windows, macOS, and Linux alike.

**NOTE:** If you set your operating system to macOS in the preceding section,
the home row mods order will be automatically rearranged into "CAGS" because
macOS shortcuts tend to use the Cmd key like Windows/Linux use the Ctrl key.
However, you can inhibit the automatic rearrangement by adding this setting:
```h
#define MACOS_USE_GACS
```

#### Difficulty level

In order to help ease your transition to using [home row mods], this keymap
provides a difficulty level setting (like in a video game) that you can set:

```h
//
// DIFFICULTY_LEVEL specifies your level of expertise with this keymap.
// It's meant to help newcomers gradually work their way up to mastery.
//
#define DIFFICULTY_LEVEL 1 // novice (500ms)
#define DIFFICULTY_LEVEL 2 // slower (400ms)
#define DIFFICULTY_LEVEL 3 // normal (300ms)
#define DIFFICULTY_LEVEL 4 // faster (200ms)
#define DIFFICULTY_LEVEL 5 // expert (100ms)
//
// You can disable this setting by omitting it or assigning a `0` zero,
// in which case it will default to my personal set of time thresholds.
//
#define DIFFICULTY_LEVEL 0 // sunaku (150ms)
//
// No matter what difficulty level you choose, you can always override
// any settings in this keymap at the beginning of this configuration.
//
```

Unless you're already proficient in using home row mods, you might consider
choosing an appropriate difficulty level to match your current abilities and
gradually increase the difficulty level as you work your way up to mastery.

On the contrary, you can disable the difficulty level feature altogether by
removing the `#define DIFFICULTY_LEVEL` line or by setting its value to zero.
Then, you can experience the default values of all settings (representing my
personal fine-tuned configuration) or directly override them per your taste.

#### One-shot shifts

The traditional pinky shift keys on the base layer are one-shot sticky shifts,
whereby tapping them temporarily activates a sticky Shift that applies itself
to the next key you tap.  This can be useful for single letter capitalization,
such as for the frequent "I" in English or when typing camel/PascalCase names.

Similarly, the combination of thumb T4 and the home row index finger key also
provides the same one-shot sticky shifting for single letter capitalization.

#### Bilateral combinations

In order to encourage proper touch-typing technique for shortcuts (where one
hand holds modifiers while the other taps keys to be modified) and for a more
natural typing experience that forgives [same-hand chords] and lingering holds,
this keymap provides bilateral combinations enforcement as an optional feature:

```h
//
// ENFORCE_BILATERAL cancels out single-handed home row mods activation by
// releasing any currently pressed mods and replacing them with plain taps.
//
// NOTE: You may still encounter "flashing mods" where an operating system
// action is triggered by the release of mods, such as LGUI which launches
// the Windows Start Menu and LALT which opens the Microsoft Office Ribbon.
//
#define ENFORCE_BILATERAL
```

Why not just use one-handed shortcuts?  I visualize it this way: I'm trying to
reach a cookie jar that is high up on a kitchen shelf, so I place one hand on
the kitchen counter (the modifier-holding hand) to stabilize myself while I
reach up for the jar with my other hand (the modified-key tapping hand). 🙋✨
In contrast, one-handed shortcuts can be more strenuous as you have to contort
your hand to hold a modifier _and_ tap modified keys; plus the act of holding a
modifier limits the hand's range of motion when reaching for keys to be tapped.

Nevertheless, if you still prefer using one-handed shortcuts, you can disable
bilateral combinations enforcement by removing the `#define ENFORCE_BILATERAL`
line and, optionally, deleting the bilateral combinations layers in the keymap.

[same-hand chords]: https://sunaku.github.io/home-row-mods.html#same-hand-chords

### Layer access keys

This keymap borrows heavily from the legendary [Miryoku] system, featuring:

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

- (macOS) https://uknowit.uwgb.edu/page.php?id=22623
    and   https://github.com/ldanet/unicode-hex-input-fix
- (Linux) https://help.ubuntu.com/stable/ubuntu-help/tips-specialchars.html.en#ctrlshiftu
- (Windows) https://github.com/samhocevar/wincompose

See also: the `UNICODE_*_DELAY` settings and the `UNICODE_SEQ_*` functions.

#### OS-native compose

If you prefer using your operating system's built-in shortcuts (rather than
Unicode) to type international characters in the World layer, activate this:

```h
//
// WORLD_USE_COMPOSE uses OS-native Compose keycodes instead of Unicode
// for characters in the "localizing" section of the `world.yaml` file.
//
#define WORLD_USE_COMPOSE
```

See also: the `COMPOSE_KEY_LINUX` setting and the `COMPOSE_SEQ_*` functions.

## Installing

Open the [keymap link above](#keymap) and follow these instructions:
1. Log in (account is required)
2. Clone the keymap to customize and/or build it!
3. Choose your base layout (place at top as layer number #0) via drag & drop.
4. Customize the keymap behavior in this text box.
5. Build the firmware and download the `*.uf2` file.

![instructions](https://github.com/sunaku/glove80-keymaps/assets/9863/4eeafe4c-0ab3-4900-b241-f62b0467a394)

### Enabling mouse emulation

Before building the firmware (step 5 above), change the version to PR23:
open the "Settings" tab, choose PR23, and then go back to the "Edit" tab.

![beta firmware](https://github.com/sunaku/glove80-keymaps/assets/26071571/25c66c06-93fe-4318-bb54-7a85e510e1fd)

Without this change, the mouse control keys on the Mouse layer won't work.

### Flashing

- For the initial flash, see ["Loading new ZMK firmware onto your Glove80"](
https://docs.moergo.com/glove80-user-guide/customizing-key-layout/#loading-new-zmk-firmware-onto-your-glove80
) and use the ["Entering bootloader mass storage device mode on power-up"](
https://docs.moergo.com/glove80-user-guide/customizing-key-layout/#entering-bootloader-mass-storage-device-mode-on-power-up
) fail-safe on both halves.  Subsequent flashes can target just the left half.

- If you're installing a different firmware version compared to what your
keyboard currently has, then ⚠️ **after flashing both halves** ⚠️ perform a
["Configuration Factory Reset and re-pair left & right halves procedure"](
https://docs.moergo.com/glove80-user-guide/troubleshooting/#configuration-factory-reset-and-re-pairing-left-and-right-halves
) on both halves and then turn RGB effects on, watch them illuminate, and
finally turn them back off for the newly installed firmware to take effect.

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

```h
// add your overrides here, up at the very top:
#define OPERATING_SYSTEM 'W' // windows
#define EMOJI_HAIR_STYLE_PRESET 'C' // curly_hair

// ... rest of snippet goes here, unchanged ...
```

For your reference, the following diagram shows the default values for all
settings and how they inherit from each other, so you can override them
together as a group (by inheritance) or each individually (fine-grained).

![Default values and inheritance for all `#define` settings](define.svg)

#### Reordering home row mods

The `*_FINGER_MOD` settings specify which modifiers are used by home row mod
keys. Miryoku's "GACS" (Win, Alt, Ctrl, Shift) order is the default -- unless
you set `OPERATING_SYSTEM` to macOS, in which case Win and Ctrl are swapped.

```h
#define PINKY_FINGER_MOD LGUI
#define RING1_FINGER_MOD LALT
#define RING2_FINGER_MOD RALT
#define MIDDY_FINGER_MOD LCTL
#define INDEX_FINGER_MOD LSFT
```

The above settings mirror finger-mod assignments across both hands, but you can
also make them different through the following additional settings if you want:

```h
#define  LEFT_PINKY_MOD RALT
#define RIGHT_PINKY_MOD LCTL
```

For completeness, here are all finger-mod settings available for customization:

```h
#define  LEFT_PINKY_MOD ...
#define RIGHT_PINKY_MOD ...
#define  LEFT_RING1_MOD ...
#define RIGHT_RING1_MOD ...
#define  LEFT_RING2_MOD ...
#define RIGHT_RING2_MOD ...
#define  LEFT_MIDDY_MOD ...
#define RIGHT_MIDDY_MOD ...
#define  LEFT_INDEX_MOD ...
#define RIGHT_INDEX_MOD ...
```

#### Fine-tuning the timing

Activate the typing layer, launch the [QMK Configurator's testing tool](
https://config.qmk.fm/#/test ), and then pretend to use home row mods. Note the
timing and duration of keystrokes reported by the tool and then use them to
adjust the `#define` time thresholds in the "Custom Defined Behaviors" snippet.

### Compiling from source

>**NOTE:** If you're on Windows, try using [Ubuntu in WSL] for the following.

1. Clone or download a copy of this Git repository (if you haven't already).

2. Install dependencies OR skip this step if you have Docker on your system:

   ```sh
   add-apt-repository universe && apt update # may be needed if using Ubuntu 
   apt install rake graphviz
   ```

3. In your copy of this repository, run `rake` OR `./rake` if using Docker.

[Ubuntu in WSL]: https://ubuntu.com/desktop/wsl

#### Unicode/Emoji characters

You can customize the preset characters in the Emoji and World layers by
editing their respective YAML source files in this repository.  Afterwards,
run the `rake` command and then copy the new `keymap.dtsi` contents back into
the "Custom Defined Behaviors" text box in the Layout Editor for your keymap.

##### Adding a new Emoji character

Suppose you wanted to add a key for the "unamused face" 😒 emoji in your keymap.

First, open the `emoji.yaml` file and add a new entry under the `codepoints` section:

```yaml
#
# codepoints:
#   <name>: "<string_of_unicode_characters>"
#
codepoints:
  unamused_face: "️😒"
```

Note that you can directly paste an Emoji character into the file, as illustrated above!

Next, [compile from source](#compiling-from-source) to generate the `&emoji_unamused_face` behavior for ZMK:

```h
UNICODE(emoji_unamused_face_macro, /* ️😒 */
  #if OPERATING_SYSTEM == 'L'
    UNICODE_SEQ_LINUX(&kp F &kp E &kp N0 &kp F), <&macro_wait_time UNICODE_SEQ_DELAY>, UNICODE_SEQ_LINUX(&kp N1 &kp F &kp N6 &kp N1 &kp N2)
  #elif OPERATING_SYSTEM == 'M'
    UNICODE_SEQ_MACOS(&kp F &kp E &kp N0 &kp F), <&macro_wait_time UNICODE_SEQ_DELAY>, UNICODE_SEQ_MACOS(&kp D &kp N8 &kp N3 &kp D &kp D &kp E &kp N1 &kp N2)
  #elif OPERATING_SYSTEM == 'W'
    UNICODE_SEQ_WINDOWS(&kp N0 &kp F &kp E &kp N0 &kp F), <&macro_wait_time UNICODE_SEQ_DELAY>, UNICODE_SEQ_WINDOWS(&kp N0 &kp N1 &kp F &kp N6 &kp N1 &kp N2)
  #endif
)
emoji_unamused_face: emoji_unamused_face {
  compatible = "zmk,behavior-mod-morph";
  #binding-cells = <0>;
  bindings = <&emoji_unamused_face_macro>, <&emoji_unamused_face_macro>;
  mods = <(~(
    #ifdef WORLD_USE_COMPOSE_FOR_emoji_unamused_face
      COMPOSE_MORPH_MODS
    #else
      UNICODE_MORPH_MODS
    #endif
  ))>;
};
```

Finally, assign `&emoji_unamused_face` to a "Custom" key in the Glove80 Layout Editor.

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

Join the [`#glorious-engrammer`][ch] channel on [MoErgo's discord server][sv].

[ch]: https://discord.com/channels/877392805654306816/1111469812850380831
[sv]: https://www.moergo.com/discord

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
