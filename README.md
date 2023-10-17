# "Glorious Engrammer" keymaps for MoErgo Glove80

These are [my Glove80][1] keymaps featuring the [Engram][2]([mer][3]) 
layouts with [Miryoku][4] layers and [home row mods][5].

[1]: https://sunaku.github.io/moergo-glove80-keyboard.html
[2]: https://sunaku.github.io/engram-keyboard-layout.html
[3]: https://sunaku.github.io/engrammer-keyboard-layout.html
[4]: https://github.com/manna-harbour/miryoku
[5]: https://sunaku.github.io/home-row-mods.html

## Legend 🚩

See [interactive layer map][6] for overview and documentation.

[6]: https://sunaku.github.io/moergo-glove80-keyboard.html#layers

## Keymaps 🗺️

- for Engrammer layout: https://my.glove80.com/#/layout/user/2ca35aae-67bf-4d9a-a5ee-38a2dc6520c4
- for Arno's Engram 2.0: https://my.glove80.com/#/layout/user/c950bf51-8758-406b-ab28-58d7bba4ade9

## Installing 🪄

> **NOTE:** Check out the handy [Quickstart Guide](
  https://github.com/sunaku/glove80-keymaps/wiki/Quickstart-Guide
) for a step-by-step tutorial that walks you through this, with screenshots!

- For the initial flash, use the "bootloader mass storage device mode" method
(see page 31 in the Glove80 User Guide).  Thereafter, use the `&bootloader`
key on any Miryoku layer: hold its thumb key and tap the top outer corner key.

- If you're installing a different firmware version compared to what your
keyboard currently has, then ⚠️ **after flashing both halves** ⚠️ perform a
*configuration factory reset* on both halves (see page 36 in the Glove80 User
Guide) and then toggle the per-key RGB effects first on and then off. ⚡  This
allows the newly installed firmware to take full effect. 💯

## Upgrading 💹

- Copy the ZMK snippet from the "Custom Defined Behaviors" text box in either
keymap linked above and paste into yours.  The contents of that text box are
also available in the `*.dtsi` files provided in this Git repository.

- You can diff and copy changes between a JSON export of your keymap (via
"Advanced Settings" > "Enable local config" then go back to "Edit" and click
"Download") and the `*.json` files provided in this Git repository.

## Discussion 🗣️

See ["Glorious Engrammer" on Discord][7] for discussion & updates.

[7]: https://discord.com/channels/877392805654306816/1111469812850380831

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
