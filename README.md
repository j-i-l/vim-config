# vim-config
Just my vimrc and some plugins I find useful.

## Vim plugins

#### [pathogen](1)
is quite usefull to handle plugins.

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

#### [senseible.vim](4)
will set some more confortable 'default' values.
To install it run:

    git clone git://github.com/tpope/vim-sensible.git ~/src/vim/bundle/vim-sensible


#### [vim-airline](3) 
makes the statusline look nice.

The installation is symple:

    git clone https://github.com/vim-airline/vim-airline ~/src/vim/bundle/vim-airline 

Then you might want some theme. They come in a git repo as well, just run:

    git clone https://github.com/vim-airline/vim-airline-themes ~/src/vim/bundle/vim-airline-themes

[Here](5) you'll find some themes.

#### [NERD tree](6)
convenient way to browse your file system.

To install:

    git clone https://github.com/scrooloose/nerdtree.git ~/src/vim/bundle/nerdtree

### [jedi-vim](7)
is a vim-pugin for autocompletion. It does a great job if you plan to use vim as a python IDE.

Same here:

    git clone --recursive https://github.com/davidhalter/jedi-vim ~/src/vim/bundle/jedi-vim


### [vim-latex](8)
is a powerfull plugin is you plan to use vim to write in latex.

This one is on sourceforge, you can go [here](9) to get the last version.

Extract it and copy the folder to `~/scr/bundle/`:

    tar -zxvf vim-latex-xxxxx.tar.gz 
    mv vim-latex-xxxxx ~/src/vim/bundle/vim-latex

For the vim-jedi plugin to work correctly you will also need to install jedi, if you are on linux, this one is symple:

    apt-get install python-jedi

### [supertab](10)
is what you have probably been looking for by now. It will allow you to use TAB instead of \<C-Space\> for the jedi plugin.

You can get it from github:

    git clone https://github.com/ervandew/supertab.git ~/src/vim/bundle/supertab

### [vim-gitgutter](11)
is a plugin that highlights changes in a git project (in case you use git).

Same here:

    git clone git clone https://github.com/airblade/vim-gitgutter.git ~/src/vim/bundle/git-gutter


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
