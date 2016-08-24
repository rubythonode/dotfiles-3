#!/bin/sh

##
# Thanks to Maxime Fabre! https://speakerdeck.com/anahkiasen/a-storm-homebrewin
# Thanks to Mathias Bynens! https://mths.be/osx
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

[ ! -f $HOME/.gitconfig ] && ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
git config --global core.excludesfile $DOTFILES/.gitignore_global

##
# Make ZSH the default shell environment
##

chsh -s $(which zsh)

##
# Install Oh-my-zsh
##

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install cobalt2 theme
wget https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme -O $HOME/.oh-my-zsh/themes/cobalt2.zsh-theme

##
# Install & execute profile
##

[ ! -f $HOME/.zshrc ] && ln -nfs $DOTFILES/.zshrc $HOME/.zshrc
source $HOME/.zshrc

##
# Install Mackup cofnig
##

[ ! -f $HOME/.mackup.cfg ] && ln -nfs $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

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
[[ $(basename $(pwd)) == "Homestead" ]] && cd $HOME/Homestead && vagrant box add laravel/homestead

##
# Install global Node packages
##

npm install gitbook-cli gulp-cli gulp yo http-server nodemon --global --save

##
# Install Rails & Jekyll
##

gem install rails
gem install jekyll

##
# Set OS X preferences
# We will run this last because this will reload the shell
##

source $DOTFILES/.osx
