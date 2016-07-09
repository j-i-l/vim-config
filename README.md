# vim-config
Just my vimrc

## Vim plugins

#### [pathogen](1)
is quite usefull to handle plugins.

To install:

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

*Note* I use the path `~/src/vim/bundle` to store the packages, often `~/.vim/bundle` is used.

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

Then you might want some themes. They come in a git repo as well, just run:

    git clone https://github.com/vim-airline/vim-airline-themes ~/src/vim/bundle/vim-airline-themes

[Here](5) you'll find some themes.

#### [NERD tree](6)
convenient way to browse your file system.

To install:

    git clone https://github.com/scrooloose/nerdtree.git ~/src/vim/bundle/nerdtree

[1]: https://github.com/tpope/vim-pathogen
[2]: https://syncthing.net/
[3]: https://github.com/vim-airline/vim-airline
[4]: https://github.com/tpope/vim-sensible
[5]: https://github.com/vim-airline/vim-airline/wiki/Screenshots
