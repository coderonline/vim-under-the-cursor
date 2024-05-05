# vim-under-the-cursor

Underlines all occurances of the word under the cursor and additionally
displays the color under the cursor if it is written as a hex value. The
alpha-channel (#rgba colors) is also supported and changes the brightness of
colors.

![screenshot](/screenshot.png)

## Installation

This should be sufficient:

    git clone https://git.entwicklerseite.de/vim-under-the-cursor \
        ~/.vim/pack/coderonline/start/vim-under-the-cursor

Or as submodule:

    git submodule add https://git.entwicklerseite.de/vim-under-the-cursor \
        ~/.vim/pack/coderonline/start/vim-under-the-cursor

Or download the zip file and extract it under `~/.vim/pack/coderonline/start/`.

## Installation using plugin managers

### vim-plug

    Plug 'coderonline/vim-under-the-cursor'

### dein.vim

    call dein#add('coderonline/vim-under-the-cursor')

