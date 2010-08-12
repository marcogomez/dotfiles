"============================================================================
"| ~/.vimrc - Marco Antonio Gomez   < marcogomez(at)aptscience.org >         |
"|---------------------------------------------------------------------------|
"|                                                                           |
"| last modified in:   2010/08/11  19:17:48                                  |
"|                                                                           |
"| This vim configuration file reflects my likes and dislikes about          |
"| the way to use vim text editor... MY WAY. It does not stands at all in    |
"| any way about the best or more correct way to do whatever you want.       |
"| Use it if you like it.                                                    |
"============================================================================

"A recent research of Professor VIM says '93.42% of users prefer jj over <ESC>'
"but certainly jj abrams disagrees! XD Lucky me I'm not jj anything! YAY! 8-)
imap jj <Esc><space>

set t_Co=256               "256 colors, yeah we are in XXI century
colorscheme aptscience     "my colorscheme: aptscience! =)
syntax on                  "sintax highlightning mode on
set nu                     "display the line numbers
set cindent                "C style indentation
set is hls ic scs          "my searching options
set sm                     "highlight start/end match of the block you're at
set wildmode=longest,list  "bash-like TAB completion
set ai                     "auto-indentation
set shiftwidth=3           "spaces used for auto-indentation
set softtabstop=3          "spaces used in TAB
set tabstop=3              "how much spaces to consider for systems/kernel TABS
set bs=2                   "makes my backspace able to delete backwards
set wm=0                   "turn off wrap right margin
set fdm=marker             "enables folding mode
set termencoding=utf8      "yeah... UTF-8 for everything
set backup                 "set backup mode on
set backupdir=~/.vimbackup "tells vim where to put backup files
set showmode               "shows me the actual mode
set showcmd                "shows me commands inserted/executed
set cul                    "highlights the actual cursor line
set nocompatible           "the REAL deal. VIM and not vi
set laststatus=2           "makes sure vim shows at the second last line
filetype plugin on         "enable load of specific plugin files
filetype indent on         "enable load of specific indentation files

set statusline=%<%F%h%m%r%h%w%y\ ft:%{&ft}\ ff:%{&ff}\
    \ Modificado:\
    \%{strftime(\"%Y\/%m\/%d\ %H\:%M\:%S\",getftime(expand(\"%:p\")))}
    \%=\ coluna:%04v\ linha:%04l\
    \total:%04L\ hex:%03.3B\ ascii:%03.3b\ %03P\

set fillchars=vert:\ ,fold:\ " <- trailing space

",d [normal mode] - removes any >=2 groups of blank lines, leaving just one
map ,d <esc>:%s/\(^\n\{2,}\)/\r/g<cr>

",w [normal mode] - save and quit... quickly! NOW!!!
map ,w <esc>:wq<cr>

",s [normal mode] - just save... quickly! NOW!!!
map ,s <esc>:w<cr>

",q [normal mode] - don't save, but quit... quickly! NOW!!!
map ,q <esc>:q!<cr>

"{ ( ou [ - automatic close of blocks on typing
imap { {}<left>
imap ( ()<left>
imap [ []<left>

",,<SPACE> [normal mode] - You know that blank characters after the end of
"                          your lines? that's it... Let's FUCK THEM UP over
"                          the entire document!
nnoremap ,,<Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

"<F2> [normal mode] - shows/hide invisible characters
map <silent> <F2> :set invlist<CR>

"<F3> [normal mode] - shows/hide last search highlightning
map <silent> <F3> :set invhlsearch<CR>

"<F4> [normal mode] - reloads my .vimrc
map <silent> <F4> :source ~/.vimrc<CR>

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Cria um cabeçalho para scripts bash
fun! BufNewFile_SH()
	normal(1G)
	:set ft=bash
	:set ts=3
	call append(0, "#!/bin/bash")
	call append(1, " ")
	call append(2, "# Marco Antonio Gomez (AptScience.com): " . strftime("%Y/%m/%d %H:%M"))
	call append(3, "# Criado com: vim  =) (Encoding:UTF-8) ")
	call append(4, " ")
	normal gg
endfun
autocmd BufNewFile *.sh call BufNewFile_SH()
map ,,sh :call BufNewFile_SH()<cr>

"Cria um cabeçalho para python
fun! BufNewFile_PY()
	normal(1G)
	:set ft=python
	:set ts=3
	call append(0, "#!/usr/bin/env python")
	call append(1, "# -*- coding: utf-8 -*-")
	call append(2, " ")
	call append(3, "# Marco Antonio Gomez (AptScience.com): " . strftime("%Y/%m/%d %H:%M"))
	call append(4, "# Criado com: vim  =) (Encoding:UTF-8) ")
	call append(5, " ")
	normal gg
endfun
autocmd BufNewFile *.py call BufNewFile_PY()
map ,,py :call BufNewFile_PY()<cr>

"Cria um cabeçalho para C
fun! BufNewFile_C()
	normal(1G)
	:set ft=c
	:set ts=3
	call append(0, "/*============================================================================")
	call append(1, " |                                                                           |")
	call append(2, " | Program:                                                                  |")
	call append(3, " | Created by: Marco Antonio Gomez   < marcogomez(at)aptscience.org >        |")
	call append(4, " |                                                                           |")
	call append(5, " | Last modified: " . strftime("%Y/%m/%d %H:%M") . "                                           |")
	call append(6, " |                                                                           |")
	call append(7, " ============================================================================*/")
	call append(8, " ")
	call append(9, "#include <stdio.h>")
	call append(10, " ")
	call append(11, "main()")
	call append(12, "{")
	call append(13, "	")
	call append(14, "	return 0;")
	call append(15, "}")
	call append(16, " ")
	normal gg
endfun
autocmd BufNewFile *.c call BufNewFile_C()
map ,,c :call BufNewFile_C()<cr>

