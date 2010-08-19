"============================================================================
"| ~/.vimrc - Marco Antonio Gomez   < marcogomez<at>aptscience.org >
"|---------------------------------------------------------------------------
"|
"| Filename: .vimrc
"| Last modified: 2010/08/19 02:34
"|
"| This vim configuration file reflects my likes and dislikes about
"| the way to use vim text editor... MY WAY. It does not stands at all in
"| any way about the best or more correct way to do whatever you want.
"| Use it if you like it.
"============================================================================

"----------------------------------------------------------------------------
"|   GENERAL SETTINGS
"----------------------------------------------------------------------------

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

"define how fillchars wil show in splits and fold
set fillchars=stl:\ ,stlnc:-,vert:\|,fold:-,diff:-

"let's set my statusline the way I like it
set statusline=%<%F%h%m%r%h%w%y\ ft:%{&ft}\ ff:%{&ff}\
    \ Modificado:\
    \%{strftime(\"%Y\/%m\/%d\ %H\:%M\:%S\",getftime(expand(\"%:p\")))}
    \%=\ coluna:%04v\ linha:%04l\
    \ total:%04L\ hex:%03.3B\ ascii:%03.3b\ %03P\

"----------------------------------------------------------------------------
"|   KEY MAP SETTINGS
"----------------------------------------------------------------------------

if has("macunix")
	"don't screw up my pastes from the clipboard
	newlinesset cb=
	"set of macrows that makes my MacBook <Fn> + <arrow keys> behave like
	"Home, End, PageUp and Pagedown
	map! ^VESCO ^VESCO
	map! ESCbi ESCbi
	map! ESCEa ESCEa
	map! ^VESCka ^VESCka
	map! ^VESCja ^VESCja
	map! ^VESClli ^VESClli
	map! ^VESCi ^VESCi
	map ^V^? x
	map ^VESCOH 0
	map ^VESCOF $
	map ^VESC[H 0
	map ^VESC[F $
	map [H I
	map [F A
endif

",d   [normal mode] - removes any >=2 groups of blank lines, leaving just one
map ,d <esc>:%s/\(^\n\{2,}\)/\r/g<cr>

",,<space> [normal mode] - delete useless blank spaces at the end of the lines
nnoremap ,,<Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

",w   [normal mode] - update 'last modified', save and quit... quickly! NOW!!!
map ,w <esc>:call SetNewLastModified()<cr>:wq<cr>

",s   [normal mode] - update 'last modified' and just save... quickly! NOW!!!
map ,s <esc>:w<cr>

",q   [normal mode] - don't save, but quit... quickly! NOW!!!
map ,q <esc>:q!<cr>

",n   [normal mode] - writes the filename in text
map ,n "%p

"<F2> [normal mode] - shows/hide invisible characters
map <silent> <F2> :set invlist<CR>

"<F3> [normal mode] - shows/hide last search highlightning
map <silent> <F3> :set invhlsearch<CR>

"<F5> [normal mode] - reloads my .vimrc
map <silent> <F5> :source ~/.vimrc<CR>

"<option>+mm [insert mode] - insert my signature and contact info
imap µµ Marco Antonio Gomez  << marcogomez<at>aptscience.org > http://aptscience.org >

"<option>+hh [insert mode] - insert current date and time the way I like
imap ˙˙ <esc>:r!date '+\%Y/\%m/\%d \%H:\%M:\%S'<cr>kJA

"{ ( ou [ - automatic close of blocks on typing
imap { {}<left>
imap ( ()<left>
imap [ []<left>

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Function that creates a head for my bash scripts
fun! BufNewFile_SH()
	normal(1G)
	:set ft=bash
	:set ts=3
	call append(0, "#!/bin/bash")
	call append(1, "#Encoding: UTF-8")
	call append(2, " ")
	call append(3, "#============================================================================")
	call append(4, "#")
	call append(5, "#  Program: " . expand("%:t"))
	call append(6, "#  Created by: Marco Antonio Gomez   < marcogomez<at>aptscience.org >")
	call append(7, "#")
	call append(8, "#  Last modified: " . strftime("%Y/%m/%d %H:%M"))
	call append(9, "#")
	call append(10, "#============================================================================")
	call append(11, " ")
	normal gg
endfun
autocmd BufNewFile *.sh call BufNewFile_SH()
map ,,sh :call BufNewFile_SH()<cr>

"Function that creates a head for my python scripts
fun! BufNewFile_PY()
	normal(1G)
	:set ft=python
	:set ts=3
	call append(0, "#!/usr/bin/env python")
	call append(1, "# -*- coding: utf-8 -*-")
	call append(2, " ")
	call append(3, "#============================================================================")
	call append(4, "#")
	call append(5, "#  Program: " . expand("%:t"))
	call append(6, "#  Created by: Marco Antonio Gomez   < marcogomez<at>aptscience.org >")
	call append(7, "#")
	call append(8, "#  Last modified: " . strftime("%Y/%m/%d %H:%M"))
	call append(9, "#")
	call append(10, "#============================================================================")
	call append(11, " ")
	normal gg
endfun
autocmd BufNewFile *.py call BufNewFile_PY()
map ,,py :call BufNewFile_PY()<cr>

"Function that creates a head for my python scripts
fun! BufNewFile_RB()
	normal(1G)
	:set ft=ruby
	:set ts=3
	call append(0, "#!/usr/bin/env ruby")
	call append(1, "#-*- coding: utf-8 -*-")
	call append(2, " ")
	call append(3, "#============================================================================")
	call append(4, "#")
	call append(5, "#  Program: " . expand("%:t"))
	call append(6, "#  Created by: Marco Antonio Gomez   < marcogomez<at>aptscience.org >")
	call append(7, "#")
	call append(8, "#  Last modified: " . strftime("%Y/%m/%d %H:%M"))
	call append(9, "#")
	call append(10, "#============================================================================")
	call append(11, " ")
	normal gg
endfun
autocmd BufNewFile *.rb call BufNewFile_RB()
map ,,rb :call BufNewFile_RB()<cr>

"Function that creates a head for my C source codes
fun! BufNewFile_C()
	normal(1G)
	:set ft=c
	:set ts=3
	call append(0, "/*===========================================================================")
	call append(1, " |")
	call append(2, " | Program: " . expand("%:t"))
	call append(3, " | Created by: Marco Antonio Gomez   < marcogomez<at>aptscience.org >")
	call append(4, " |")
	call append(5, " |")
	call append(6, " |")
	call append(7, " |")
	call append(8, " | Last modified: " . strftime("%Y/%m/%d %H:%M"))
	call append(9, " |")
	call append(10, " ===========================================================================*/")
	call append(11, " ")
	call append(12, "#include <stdio.h>")
	call append(13, " ")
	call append(14, "main()")
	call append(15, "{")
	call append(16, "	")
	call append(17, "	return 0;")
	call append(18, "}")
	call append(19, " ")
	normal gg
endfun
autocmd BufNewFile *.c call BufNewFile_C()
map ,,c :call BufNewFile_C()<cr>

"Function that replace the 'Last modified' info on the head of my files
"once I save them again. Really usefull so I can track my updates
fun! SetNewLastModified()
	if getline(1) =~ ".*Last modified: " ||
				\ getline(2) =~ ".*Last modified: "  ||
				\ getline(3) =~ ".*Last modified: "  ||
				\ getline(4) =~ ".*Last modified: "  ||
				\ getline(5) =~ ".*Last modified: "  ||
				\ getline(6) =~ ".*Last modified: "  ||
				\ getline(7) =~ ".*Last modified: "  ||
				\ getline(8) =~ ".*Last modified: "  ||
				\ getline(9) =~ ".*Last modified: "  ||
				\ getline(10) =~ ".*Last modified: "
		exec ':1,10s/\d\{4}\/\d\{2}\/\d\{2} \d\{2}:\d\{2}/' . strftime('%Y\/%m\/%d %H\:%M') . '/'
	endif
endfun
map ,,u :call SetNewLastModified()<cr>

"Function to enable the smart tab completion
function! Smart_TabComplete()
	let line = getline('.')                         " curline
	let substr = strpart(line, -1, col('.')+1)      " from start to cursor
	let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
	if (strlen(substr)==0)                          " nothing to match on empty string
		return "\<tab>"
	endif
	let has_period = match(substr, '\.') != -1      " position of period, if any
	let has_slash = match(substr, '\/') != -1       " position of slash, if any
	if (!has_period && !has_slash)
		return "\<C-X>\<C-P>"                         " existing text matching
	elseif ( has_slash )
		return "\<C-X>\<C-F>"                         " file matching
	else
		return "\<C-X>\<C-O>"                         " plugin matching
	endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

