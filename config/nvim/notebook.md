Conventions: Vim keystroke sequences are in code blocks and from time to time are followed by <CTRL> or <ESC>, these are marked differently as they are mapped differently in different keyboards. There's also significance to where a sequence begins; so, an example would include [start: x] marking the character when the cursor is at before the sequence.

So, without further ado, here's my Vim A --> Z list...

A - Append, Amend
Lower case a will transition you into insert mode to the character on the right of the current location.
Example: [start: W] at WRD ("W"): use this sequence: aO<ESC>, the cursor will end up back in normal mode having WORD written; a starts editing to the right of W, O is inserted, and <ESC> throws back to normal mode.

Upper case A would have the same effect but in the end of a line, so if my text is TWO WORD and I run AS.<ESC> I'll end up with TWO WORDS..
Tip: its counterpart is I; the same effect as A but at the beginning of the line.

B - Backwards, Beginning
Lower case b will move to the beginning of the current word, if the cursor is already there, it'll go to the previous word's first character.
B would do the same but to the beginning of the line (starting to get the idea?). I like to think about the capital versions of the Vim keystrokes and strong stokes.
Tip: its counterpart stroke is e (end) or w (next word's beginning).

C - Change
c is usually followed by a motion; c combined with the listed above b, would take you to insert mode changing everything from the current location to the beginning of the word.
Example: [start: R] in WORD, hit cbX, you end up with XRD.
Since any Vim motion is relevant here, it can be run with some powerful combinations; e.g. ciw means "change in the word", deletes the word while transitioning to normal mode.
C in the case would change the entire line to its end from the current location.
Tip: D would do the same (as we'll see in a moment) but without the insert mode part.

D - Delete
d would delete any motion that would follow, so diw would be "delete in the word" which is similar to ciw but the end result is still normal mode.
Useful combinations:

dip "delete in paragraph"
dgg - "delete from here up"
dG - "delete from here down"
dd "delete the current line" Tip: has a small brother x that has roughly the same effect but on a single character.
E - End
e: you guessed it - takes you to the end of a word or the End of a line.

F - Find!
A very useful motion; f would find the character it's combined with; e.g. fX would find the next X appearance in a sentence. Using F would have the same effect but in a backward search.
Tip #1: combined with ; (next result), "find" becomes a very powerful motion in Vim to quickly find a character instead of moving towards it in slower or more keystrokes. ; works both backward and forward - depends on the original motion (f vs F).
Tip #2: f can be combined with other motions, to name a useful one - marking a visual block until a certain point including the point, one would use vfx where x is the character in question. Let's put this into a more solid example; consider the line "Here sleeps the hairy brown fox" [start: H], and the goal is to visually mark "Here sleeps the hairy", a sequence can be vfy as in "Visually mark until char y including." Sub-tip: if the end result wanted is the same but without the last char, use t as in vty to "Mark to y".

We're done with f - let's take a look on a visual that shows some of it:

Visual Vim motions in a line
G - Go
This is actually my own interpretation, g goes places but with a bit different motions, Vim authors did not provide a significance to it on its own. Useful combinations: gg to go the very beginning to the file, while G would do the same but to the end.
Tip: Find a comprehensive list of all the options with :help *g*.

H - An arrow replacement
h is one of the "special four" hjkl which are the basic arrows in Vim (sides, up & down), where h is used for left.
Addition suggested by Giuseppe Caruso:
H will take the cursor to the top of the page.

I - Insert
i is one of the most useful keystrokes in Vim, maybe only second to <ESC>. i transitions from normal mode to insert mode. In the same way I does the same but at the beginning of the line.
Useful (and advanced) Tip:
Since I edits the beginning of the line which is not a usual requirement of a user, I find myself requiring a prefix to a block or a number of lines. Using visual block (which we'll cover below with V) one can mark a visual block with <CTRL>v then when a block is marked, use I to start editing. When the edit is done hit <ESC> to
go back to normal mode but with the entire block prefixed with the change.

Example: [start: L] hit <CTRL>vjjI*<SPACE><ESC>:
Line one
Line two
Line twenty-two
Can you guess the result?
Let's review the motions:

Start a visual block (<CTRL>-v)
Jump down twice (jj)
Insert an asterisk followed by a space at the beginning of the line
Go back to normal mode, and behold: MAGIC 😮
* Line one
* Line two
* Line twenty-two
J - An arrow replacement
j is one of the "special four" hjkl which are the basic arrows in Vim (sides, up & down), where j is used for down.
Tip #1: j happens to be a rare English letter, and the key on a keyboard happens to be quite far considering its extensive use in the switch back to normal mode,
there's a convention of mapping jj to <ESC> and use the already-in-read key to make the transition.
Here's the mapping for your convenience: imap jj <Esc>. As with any other change (especially in Vim) it takes a while to get used to, but it's very much worth the wait.
Tip #2 suggested by the reader @argon2008aiti:
J (capital) joins the line below after the cursor, this is useful when the cursor is standing at the end of a line and the line below should be joined to the same point. Usually, a user would go down a line, find the beginning of a sentence and delete backward to the earlier location.

K - An arrow replacement
K is one of the "special four" hjkl which are the basic arrows in Vim (sides, up & down), where k is used for up.

L - An arrow replacement
L is one of the "special four" hjkl which are the basic arrows in Vim (sides, up & down), where l is used for right. (An absurd thinking about the concept of this post, one would expect "l" to be used for left :+1)... :trollface:

M - Mark
Vim supports a powerful marking feature. Using Registers, it can save locations in a document with m like so: ma would save the current location to the register a, go back to it from each other location with 'a (a can be replaced here with any other character that can represent a register).
Relevant tip: if you did not remember to mark your location, which we normally don't in the flow of work, '' will always jump back to the previous location.
Addition suggested by Giuseppe Caruso:
M will move the cursor to the middle of the page (same as zz).

N - Next
n will go to the next result of a search. Since this is a circular motion (next after the last result is the first), n is used to go forward and N to go back.
Relevant info: to those who are not familiar, search in Vim is triggered with / followed by search text. Beyond the obvious use-case of searching an appearance or a specific result, this is a useful motion; even if you already know and see the location of your target. Moving a cursor sometimes takes more keystrokes than just searching for the word (and maybe combining it with an n).

O - Open line
Not certain whether this was, in fact, the author's intention, o does exactly that: it opens a new line below the cursor. Using O would do the same but above.

Here's something I did not yet figure to a level I'm satisfied with: o opens a line and transitions to insert mode, there are many times I'd like to open a new line below or above the cursor without adding new text, I've tried different mappings and combinations, but ended up back where I started with o followed by <ECS>. I'll use this stage to ask - had anyone found a better solution to this very specific yet annoying problem?

P - Paste, Paragraph
p's most common usage is pasting something that has been yanked or cut (remember Vim treats delete as cut too). pasting is done after the cursor while P does it before.
Tip: Registers come in handy once again; paste from a register by combining it before the motion: with text saved into the a register, "adiw would "delete in word and save to the a register". Use the register's content and paste it using "ap ("paste after the cursor from register a").

Q - Quit (and Reqord macros)
This bad spelled word is how I initially memorized where macros are starting their way :)
q is used to quit Vim, either with :q which is the basic, :qw to quit and write, q! to quit even if work hasn't been saved and more.
Having that said, as a motion, q is used to record a sequence of operations and repeat them, or as this is called in the Vim terminology "macros", more on macros (A-lot more) in my next and very soon blog post.
For the time being here's a quick tip: Recording is done into registers just like yanking and cutting; use qq to record into register q, and do run a sequence of commands. Another hit on q would stop the record making it available for execution with @q.

R - Replace
While r is as simple as replacing the current character with another (ra will replace the current location with a), R is a powerful one yet rare; R would transition into the odd replace mode, which is essentially an insert mode that overrides characters. When block-width matters or there's an order of alignment, this small feature comes in very handy.

S - Substitute
Being honest here - s is the one motion of this entire list I did not recall and as such, I have never used it. I find it quite unnecessary having c motion that transitions into insert mode with the combined motion. s would do the same while editing "on the spot": substituting the current character and editing from thereon. Useful when the end result is a substitution of a single character, yet this could be achieved with x&i or r&<ESC>.
Using S would substitute the current block while keeping you in insert mode.
Tip: I personally map <leader>ss to toggle Vim's spell checker, (yes it has one), here's the mapping:
nnoremap <leader>ss :setlocal spell spelllang=en_us<CR>
Another "s" map I have is ss to disable the highlight after searching a word resulting the highlights of all results, here it this map from my .vimrc:
nnoremap ss :noh<CR>
T - To
Mentioned previously in the F section, t means "do something until" (or to); vtx means "visually mark to x" (without x). Or dtf (this is just a random example...) would be "delete to char f".

U - Undo
As simple as that, u would undo changes. It's big brother U has a rather strange result - undoing changes done in the same line since the cursor last moved into it.

V - Visual
v is your way to mark chars / words / lines / blocks in Vim in order to do something with it; deleting, yanking or maybe indenting (>>).

W - Word
This motion was mentioned multiple times above as it comes hand in hand with end & back; w is a motion that jumps to the next beginning of a word.
W is quite interesting: while w is the current word, W is the "word block", which means it includes all characters between two spaces.
Example: "some-name,still-no-space" is not one word, but Vim would consider it one if addresses as W.
How is this useful? With motions of course: viW is "visually mark a block in the Word" (between the two closest spaces). Obviously, this can be combined with any other motion in Vim.

X - Cross out?
The one letter in the English alphabet which I couldn't have found an actual phonetic resolution; x would remove a single character under the cursor. (Remember: s would do the same resulting in insert mode, x would not).
X would be the same but backward.

Y - Yank
One of the most useful and basic motions in Vim - y copies text, by default into the unnamed register, ready to be pasted back in another location. Its big brother Y would copy the entire line with one stroke (I'm used to doing the same with yy).

Z - Welcome it! Last and pretty useless on its own: "Z"
While on it's own z has no effect (:help z), it's in charge of a useful Vim feature called "folding", where the user can wrap text and fold into collapse & extendable blocks, read about it some more in my Vim notebook.
ZZ is the quick way to save and exit - yes, your complicated and physically challenging :wq! is way too much (on Vim and on your body).

Additions suggested by Giuseppe Caruso:

zz places the line in the middle of the buffer
zt cursor line at top of the window
zb cursor line at bottom of the window
