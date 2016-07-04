# vim-config
Just my vimrc

## Vim plugins

[pathogen](1) is quite usefull to handle plugins.

To synchronize plugins between different computers and make sure to have a plugin installed on all devices once it is installed 
on one, you can use a sync client like [syncthing](2). Make sure to synchronize the `bundle` folder in which you copy the plugin.

For example:

Put your plugins in `~/src/vim/bundle`

Synchronize this folder between the wanted devices.

Add the following line to your `.vimrc` on each device:

    execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')




[1]: https://github.com/tpope/vim-pathogen
[2]: https://syncthing.net/
