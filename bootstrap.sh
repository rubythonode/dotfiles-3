#!/bin/sh

##
# Thanks Maxime Fabre! https://speakerdeck.com/anahkiasen/a-storm-homebrewin
# Thanks Mathias Bynens! https://mths.be/osx
##

##
# Set temporary variable
##

DOTFILES=$HOME/dotfiles

##
# Update dotfiles itself first
##

[ -d "$DOTFILES/.git" ] && git --work-tree="$DOTFILES" --git-dir="$DOTFILES/.git" pull origin master

##
# Check for Homebrew and install if we don't have it
##

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

##
# Update Homebrew recipes
##

brew update

##
# Install all our dependencies with bundle (See Brewfile)
##

brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup
brew cask cleanup

##
# Launch sublime in command line
##

# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

##
# Install global Git configuration
##

ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
git config --global core.excludesfile $DOTFILES/.gitignore_global
git config --global user.name "appkr"
git config --global user.email "juwonkim@me.com"

##
# Make ZSH the default shell environment
##

chsh -s $(which zsh)

##
# Install Oh-my-zsh
##

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install cobalt2 theme
# wget https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme -O $HOME/.oh-my-zsh/themes/cobalt2.zsh-theme

# Install Powerline theme
wget https://raw.githubusercontent.com/jeremyFreeAgent/oh-my-zsh-powerline-theme/master/powerline.zsh-theme -O $HOME/.oh-my-zsh/themes/powerline.zsh-theme
git clone git@github.com:powerline/fonts.git && bash fonts/install.sh
sleep 3
rm -rf fonts

##
# Install & execute profile
##

# Always prefer dotfiles' .zshrc
# [ ! -f $HOME/.zshrc ] && ln -nfs $DOTFILES/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc

##
# Install Mackup config
##

[ ! -f $HOME/.mackup.cfg ] && ln -nfs $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

##
# Install .nanorc
##

ln -nfs $DOTFILES/.nanorc $HOME/.nanorc

##
# Install Composer
##

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

##
# Install global Composer packages
##

/usr/local/bin/composer global require laravel/installer laravel/envoy laravel/valet tightenco/jigsaw

##
# Install Laravel Valet
##

$HOME/.composer/vendor/bin/valet install
cd $HOME/workspace && $HOME/.composer/vendor/bin/valet park

##
# Install Homestead Repo & Add vagrant box
##

git clone git@github.com:laravel/homestead.git $HOME/Homestead
bash $HOME/Homestead/init.sh
[[ $(basename $(pwd)) != "Homestead" ]] && cd $HOME/Homestead && vagrant box add laravel/homestead

##
# Install global Node packages
##

npm install gitbook-cli gulp-cli gulp yo http-server nodemon bower --global --save

##
# Install Rails & Jekyll
##

gem install rails
gem install jekyll

##
# Source profile
##

source $HOME/.zshrc

##
# Set OS X preferences
# We will run this last because this will reload the shell
##

source $DOTFILES/.osx
