# vim-config
Just my vimrc and some plugins I find useful.

## Vim plugins

#### [pathogen](1)
is quite useful to handle plugins.

To install:

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

*Note*
I use the path `~/src/vim/bundle` to store the packages, often `~/.vim/bundle` is used.

To synchronize plugins between different computers and make sure to have a plugin installed on all devices once it is installed 
on one, you can use a sync client like [syncthing](2). Make sure to synchronize the `bundle` folder in which you copy the plugin.

For example:

Put your plugins in `~/src/vim/bundle`

Synchronize this folder between the wanted devices.

Add the following line to your `.vimrc` on each device:

    execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')

#### [sensible.vim](4)
will set some more comfortable 'default' values.
To install it run:

    git clone git://github.com/tpope/vim-sensible.git ~/src/vim/bundle/vim-sensible


#### [vim-airline](3) 
makes the status line look nice.

The installation is simple:

    git clone https://github.com/vim-airline/vim-airline ~/src/vim/bundle/vim-airline 

Then you might want some theme. They come in a git repo as well, just run:

    git clone https://github.com/vim-airline/vim-airline-themes ~/src/vim/bundle/vim-airline-themes

[Here](5) you'll find some themes.

#### [NERD tree](6)
convenient way to browse your file system.

To install:

    git clone https://github.com/scrooloose/nerdtree.git ~/src/vim/bundle/nerdtree

#### [nerdtree-tabs](16)

makes nerdtree more feel like a panel and less like a tab.

To install:

    git clone https://github.com/jistr/vim-nerdtree-tabs.git ~/src/vim/bundle/nerdtree-tabs

For command configs see the .vimrc

#### [nerdtree-execute](13)

is a plug-in for [NERDTree](6) that provides an execute menu item, allowing to use the systems default application to open a node. This is particularly useful if you want to open e.g. pdf files.

To install:

    git clone https://github.com/ivalkeen/nerdtree-execute ~/src/vim/bundle/nerdtree-execute


#### [nerd-commenter](18)

comes in handy if you are coding and want fancy commenting features.

Installation:


        git clone https://github.com/scrooloose/nerdcommenter.git ~/src/vim/bundle/nerd-commenter

Some useful configs can be found in the .vimrc.
    
#### [jedi-vim](7)
is a vim-pugin for autocompletion. It does a great job if you plan to use vim as a python IDE.

Same here:

    git clone --recursive https://github.com/davidhalter/jedi-vim ~/src/vim/bundle/jedi-vim

For the vim-jedi plugin to work correctly you will also need to install jedi, if you are on linux, this one is symple:

    apt-get install python-jedi

#### [vim-latex](8)
is a powerful plugin is you plan to use vim to write in latex.

This one is on sourceforge, you can go [here](9) to get the last version.

Extract it and copy the folder to `~/scr/bundle/`:

    tar -zxvf vim-latex-xxxxx.tar.gz 
    mv vim-latex-xxxxx ~/src/vim/bundle/vim-latex

#### [supertab](10)
is what you have probably been looking for by now. It will allow you to use TAB instead of \<C-Space\> for the jedi plugin.

You can get it from github:

    git clone https://github.com/ervandew/supertab.git ~/src/vim/bundle/supertab

See the .vimrc file for further configurations of this plugin.

#### [vim-gitgutter](11)
is a plugin that highlights changes in a git project (in case you use git).

Same here:

    git clone git clone https://github.com/airblade/vim-gitgutter.git ~/src/vim/bundle/git-gutter

#### [vim-fugitive](12)
is a plugin if you want to use git within vim.

Installing it:

    git clone https://github.com/tpope/vim-fugitive.git ~/src/vim/bundle/vim-fugitive
    vim -u NONE -c "helptags vim-fugitive/doc" -c q

#### [vim-merginal](17)
is a great addon to the fugitive plugin. It facilitates switching between
branches, merging, cherry picking, etc.

Installing it:

    git clone https://github.com/idanarye/vim-merginal.vim ~/src/vim/bundle/vim-merginal

The only command you need to remember to use Merginal is, tadaa, `:Merginal`.
####[ctrlp](15)
is a nice search tool. To install:

    git clone https://github.com/ctrlpvim/ctrlp.vim ~/src/vim/bundle/ctrlp

and add the following line in your .vimrc

    set runtimepath^=~/src/vim/bundle/ctrlp

You might want to have a look at further options for this plugin in the .vimrc
file.

### [VIM: Hard Mode](14)

no, this is not a game. This is a plugin that will help you on your journey to become a master of VIM. It does so by disabling character-wise navigation functionality (e.g. hjkl-keys). 

Installation is same same:

    git clone https://github.com/wikitopian/hardmode ~/src/vim/bundle/hardmode

To turn it on:

    :call HardMode()

And if you want to chicken out type:

    :call EasyMode()

[1]: https://github.com/tpope/vim-pathogen
[2]: https://syncthing.net/
[3]: https://github.com/vim-airline/vim-airline
[4]: https://github.com/tpope/vim-sensible
[5]: https://github.com/vim-airline/vim-airline/wiki/Screenshots
[6]: https://github.com/scrooloose/nerdtree
[7]: https://github.com/davidhalter/jedi-vim 
[8]: http://vim-latex.sourceforge.net/
[9]: https://sourceforge.net/projects/vim-latex/files/latest/download?source=files
[10]: http://www.vim.org/scripts/script.php?script_id=1643
[11]: https://github.com/airblade/vim-gitgutter
[12]: https://github.com/tpope/vim-fugitive
[13]: https://github.com/ivalkeen/nerdtree-execute 
[14]: https://github.com/wikitopian/hardmode
[15]: https://github.com/ctrlpvim/ctrlp
[16]: https://github.com/jistr/vim-nerdtree-tabs
[17]: https://github.com/idanarye/vim-merginal
[18]: https://github.com/scrooloose/nerdcommenter
