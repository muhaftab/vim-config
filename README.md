## Install and configure Vim with autocompletion
<ul>
 	<li>Remove Vim if already exists
<pre code="" bash="">sudo apt-get purge vim vim-common vim-runtime vim-tiny
rm -rf ~/.vim
</pre>
</li>
 	<li>install required packages
<pre code="" bash="" class="">sudo apt-get install build-essential cmake checkinstall \
               python-dev python3-dev \
               libncurses5-dev libgnome2-dev libgnomeui-dev \
               libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
               libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
               ruby-dev git
</pre>
</li>


&nbsp;
 	<li>install vim
<pre code="" bash="">cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-x86_64-linux-gnu \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make -j4 VIMRUNTIMEDIR=/usr/share/vim/vim80
sudo make install
</pre>
</li>


&nbsp;
 	<li>Set vim as your default editor with update-alternatives.
<pre>sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
</pre>
</li>


&nbsp;
 	<li>prevent package manager from updating vim
<pre code="" bash="" class="">sudo apt-mark hold vim</pre>
</li>


&nbsp;
 	<li>Install Vundle plugin manager
<pre class="lang:default decode:true">mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim</pre>
</li>

&nbsp;
 	<li>Clone this repo
<pre class="lang:default decode:true">
DIR=~/Repos/vim-config
git clone https://github.com/muhaftab/vim-config.git $DIR</pre>
</li>


&nbsp;
<li>Create symlinks to point to repo contents
<pre class="lang:default decode:true">
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/ideavimrc ~/.ideavimrc
ln -s $DIR/colors ~/.vim/colors
ln -s $DIR/ftdetect ~/.vim/ftdetect
ln -s $DIR/ftplugin ~/.vim/ftplugin
ln -s $DIR/plugin ~/.vim/plugin
ln -s $DIR/syntax ~/.vim/syntax
</pre>
</li>

&nbsp;
<li>Link `~/.vim/dict` with the Dropbox `dict` folder
<pre class="lang:default decode:true">
ln -s ~/Dropbox/linux/vim/dict ~/.vim/dict
</pre>
</li>


&nbsp;
 	<li>Run this command to install plugins.
<pre code="" bash="">vim +PluginInstall +qall</pre>
</li>


&nbsp;
 	<li><em>YouCompleteMe</em> plugin is installed but will not work until we compile YCM with semantic support for C-family languages (and of course python):
<pre code="" bash="">cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
# or
#./install.py --clang-completer --system-libclang --system-boost
</pre>
</li>


&nbsp;
 	<li>Again, run this command. This time <em>YouCompleteMe</em> will install correctly.
<pre code="" bash="">vim +PluginInstall +qall</pre>
</li>


&nbsp;
 	<li>Add LaTex support: the plugin has already been added to <em>~/.vimrc</em> above. However, you still need to install these:
<pre>sudo apt-get install latexmk
</pre>
Use the plugin shortcuts <code>\ll</code> and <code>\lv</code> to compile and view.</li>
</ul>

## Vim style bindings for other programs
<ul>
  <li><strong>Sublime Text:</strong> Press <code>CTRL+SHIFT+P</code>, and type <code>Package Control:Install Package</code> in the pop-up window. Now type 'Vintageous' and press enter.</li>
  <li><strong>BASH Shell:</strong> Add <code>set -o vi</code> to <code>~/.bashrc</code>. By default, BASH shell will be in insert mode. Press Escape key to enable vim navigation</li> 
  <li><strong>Google Chrome:</strong> Add extension <code>Vimium</code>.</li> 
</ul>

## References
1. https://github.com/Valloric/YouCompleteMe
