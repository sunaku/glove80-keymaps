# Symbol Layer

> Video: https://youtu.be/uuSR81wc6WQ

The symbol layer is a programmer's best friend.  It provides convenient access
to punctuation marks and other symbols that arise frequently in computer
programming and software development: such as when typing code or system
commands, or even navigating & editing code in modal text editors such as Vim.

In this video, I'll cover my symbol layer which is the result of hundreds of
different layout variations that I've designed, tested, and refined over the
course of a decade, guided by insight gained from real-world use and, more
recently, with improvements based on feedback from the Glove80 community.

## Activation

To activate the symbol layer momentarily, press & hold the nearest key in the
lower arc of the right hand's thumb cluster.  When you release this key, the
symbol layer is deactivated and the keyboard goes back to your original layer.

> For example, when I hold down the symbol layer key and type the left hand's
> home row keys, I see symbols being typed on the screen.  But when I release
> the layer key and type the same home row keys again, I now see letters from
> the base layer instead -- which is what you would normally expect.

To keep the symbol layer activated until you choose otherwise, hold the nearest
Lower key and tap the symbol layer key.  This is called "layer locking" and it
allows you to lock into a layer without needing to hold down the layer key.

> For example, when I lock the symbol layer and type the left hand's home row
> keys, I see symbols being typed on the screen even though I'm not holding
> down the layer key with my right thumb anymore.

To unlock a locked symbol layer, simply tap the same Lower key once again.

> For example, after unlocking the symbol layer, I now see letters from the
> base layer being typed on the screen when I tap through the home row keys.

Now let's talk about the symbols themselves, starting with the home row.

## Home row

On the middle finger, we have `_` the underscore symbol, which is used to
delimit words in snake_case identifiers.

Beside it, on the ring finger, we have the `=` equals sign, which is used for
`x = y` variable assignment, in `>=` mathematical inequalities and `=>` arrows.
In Vim, it also serves as the auto-indent operator, adjusting the indentation
level of the current line or selection according to the surrounding code.

Stepping out by a column on either side, we have the `^` caret symbol on the
pinky finger and `$` dollar sign on the index finger.  These serve as anchors
in regular expressions, denoting the start of a line and the end of a line
respectively. In Vim, they also serve as motion operators: with the `^` caret
symbol moving your cursor to the first printable character near the start of
the current line, and with `$` dollar sign moving your cursor to the end of
the current line.

Notice how these operators are laid out left-to-right, according to the
direction in which they move your cursor.  This makes them *spatially
mnemonic* so they feel more natural, intuitive, and easy to remember.

Finally, on the far left, we have the `#` hash symbol on the pinky finger,
which serves as a comment marker in many scripting languages.  And on the far
right, we have the `*` star symbol on the index finger, which serves as a
wildcard character in filename patterns.  In Vim, these also serve as search
operators: with `#` hash searching backwards for the word that is currently
under your cursor, and with `*` star searching forwards for the word that is
currently under your cursor.

Notice how the left-to-right arrangement of these operators reflects the
direction in which they move your cursor.  As before, this makes them
*spatially mnemonic* as well.

And speaking of searching, the `*` star symbol on the home row connects us to
the **Vim search cluster** that is laid out vertically along the central
column of the index finger.  This cluster is made of three Vim operators:

* `?` question mark to search backwards using a regular expression that you supply
* `*` star to search forwards for the word that is currently under your cursor
* `/` slash to search forwards using a regular expression that you supply

Notice how these operators are laid out top-to-bottom, according to the
direction in which they move your cursor.  As before, this makes them
*spatially mnemonic* as well.

## Upper rows

On the upper row, we have `{}` curly braces on the pinky and index fingers.
In Vim, these serve as paragraph motion operators, which move the cursor
between blocks of text that are separated by one or more blank lines.

In the center, we have a **quotation mark cluster** composed of `'` single quote
on the ring finger, `"` double quote on the middle finger, and `\`` backtick
(which I also type with my ring finger) if you reach up into the number row.

On the number row, we have `()` parentheses on the ring and middle fingers. In
Vim, these serve as sentence motion operators, which move the cursor between
sentences (defined as a run of text that is terminated by a `.` dot symbol).

At the end of the number row, we have `;` semicolon and `,` comma, both on the
index finger.  Together with `()` parentheses, these form a **function call
cluster** for zero-arity function calls: as `();` standalone statements or
`(),` nested in a list.  In Vim, they also serve as jump repetition operators,
repeating the most recent f/F/t/T jump forwards and backwards respectively.

Finally, on the outer ends of the upper row, we have the `!` exclamation mark
on the pinky finger and the `?` question mark on the index finger.  They are
positioned for easy combination with `()` parentheses on the row above for
`!()` grouped negation in Boolean expressions, for `()?` optional group
captures in regular expressions as well as the ternary operator in C, and for
`?()` calling predicate functions that return a Boolean value in some programming
languages, like Ruby and Elixir.

## Lower rows

The `=` equals sign on the home row leads us to the arrow cluster, which is
highlighted in green in the layer diagram. This cluster allows us to type:

* `=>` fat arrows facing right, for key/value pairs in Perl
* `->` thin arrows facing right, for walking pointers in C
* `<-` thin arrows facing left, for variable assignments in R
* `~>` squiggly arrow, for pessimistic version number constraints
* `<=` less than or equal to
* `>=` greater than or equal to
* `<>` not equal to in SQL
* `|>` pipe operator in Elixir
* and so on...

On the lower row, we have the `<>` angle brackets on the pinky and index
fingers mirroring the `{}` curly braces on the upper row.  In Vim, angle
brackets change the level of indentation in the same direction that their
angle points to, so this arrangement makes them *spatially mnemonic* as well.

Stepping out to the ends of the lower row, we have the `~` tidle symbol on the
pinky finger and the `/` forward slash symbol on the index finger. Together,
these form the `~/` filesystem path to the user's home directory in UNIX
systems.

Going down to the bottom row, we have `[]` square brackets located centrally
on the ring and middle fingers, mirroring the arrangement of `()` parentheses
way up above on the number row.  In Vim, square brackets jump between things,
such as syntax blocks, warning & error locations, paste boundaries, and so on.

Surrounding that, we have the `&` AND symbol on the pinky finger and the `+`
plus sign on the index finger.  These are positioned so that they pair
logically with their counterparts on the row above: the `|` OR symbol on the
ring finger and the `-` minus sign on the middle finger.  In addition to their
vertical affinity, these pairs are also *spatially mnemonic* left-to-right:
for example, the `-` minus sign precedes the `+` plus sign along both axes.

## Thumb cluster

On the upper arc of the thumb cluster, we have `\` backslash for escaping all
symbols on the other fingers.  For example, we can use this to escape
double-quotation marks inside a double-quoted string: "double \"ESC\" quotes".
Similarly, we can also use this to escape regular expression delimiters when
matching filesystem paths containing directory separators in UNIX: /\/home\//.
Another common scenario is to escape parentheses in an extended regular
expression to disable their group capture behavior: /funcall\(\)/.

Next, let's finish off the upper arc *with a swipe*: leading from the `.` dot
symbol in the middle of the arc onto the `*` star symbol at the end of the
arc.  We can also swipe back and forth when typing `*.*` star dot star, which
is useful for matching filenames with extensions in a filesystem glob pattern.

On we go, to the lower arc of the thumb cluster.  On the nearest key of the
lower arc of the thumb cluster, we have the `%` percent sign which serves as
the "matchit" operator in Vim: it jumps you to the corresponding delimiter for
the word under the cursor or, failing that, to nearest surrounding delimiter.

On the middle key in the lower arc of the thumb cluster, we have the `:` colon
symbol, which serves as a `x?y:z` ternary operator separator in C, is doubled
as `::` a namespace separator in C++, and is also the command mode key in Vim.

On the furthest key in the lower arc of the thumb cluster, we have the `;`
semicolon, which serves as a statement separator in C and many other languages.

## Spacegrams

When typing two symbols separated by a space, you normally have to first let go
of the symbol layer key after you type the first symbol, and then tap it for
space, and finally hold it again to reactivate the symbol layer for the second
symbol.  This anti-pattern is called a "spacegram" because it involves typing a
space in a sequence of other characters, which can be disruptive to our typing
rhythm, requiring a delicately timed dance around the spacebar.

To avoid breaking our typing rhythm in such cases, we can use the additional
spacebar (as well as backspace, tab, and enter) on the right hand's home row.
This way, we don't need to exit the Symbol layer to type spaces, newlines, or
even to correct our typing mistakes!

Let's take a closer look at these keys, which I call "spacegram operators":

On the index finger, we have Backspace to erase a character going to the left.
This is equivalent to Ctrl+H in UNIX and reminiscent of the letter `h` in Vim,
which all mnemonically coincide with the letter "H" in Arno's Engram layout
(located on the right hand index finger's resting position on the home row).

Directly beneath this Backspace key on the lower row, we have the Delete key.
This forms an erasure cluster, with one key erasing to the left and the other
erasing to the right.

On the middle finger, we have Tab which is mnemonic with the letter "T" (which
stands for *Tab*) in the Engram layout.  This is useful for invoking tab
completion, whether at a shell command line or while coding in an IDE.
Similarly, we have Shift+Tab directly underneath, on the lower row, for
navigating tab completion menus or choices in the opposite direction.

On the ring finger, we have Spacebar, which is mnemonic with the letter "S"
(which stands for *Space*) in the Engram layout.  As mentioned before, this
lets us type spaces without having to leave the Symbol layer.

On the pinky finger, we have Enter, which is mnemonic with the letter "N"
(which stands for *Newline*) in the Engram layout.  Similarly, this lets us
press Enter for newlines without having to leave the Symbol layer.

## Base layer symbols

In the symbol layer diagram, you may notice that there are several redundant
symbols on the right half of the keyboard, colored in gray.  These are base
layer symbols that pass through into the Symbol layer, just for convenience.
For instance, you may be accustomed to using these symbols on the base layer
so having them available here lets your muscle memory type them as necessary.

## Demonstration

Now let's put all of these concepts to work in a demonstration, typing up some code.

> Video: https://youtu.be/fPcO5NGoDao

## Conclusion

This concludes the video tour of my symbol layer...  But wait, there's more!
There are interactive examples of typing various bigrams and other sequences
on my website under the Symbol layer section, where you can see the placement
of the keys involved and visualize the animated sequence of how to type them.
Moreover, language specifics and my design rationale are also explained here.

Thanks for watching.  Stay tuned for more videos in this series coming up next.
