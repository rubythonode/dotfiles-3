#-------------------------------------------------------------------------------
# Taps
#-------------------------------------------------------------------------------

tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'caskroom/versions'
tap 'homebrew/dupes'
tap 'homebrew/php'
tap 'homebrew/services'
tap 'homebrew/versions'

#-------------------------------------------------------------------------------
# Make sure apps get installed in system Applications dir
#-------------------------------------------------------------------------------

cask_args appdir: '/Applications'

#-------------------------------------------------------------------------------
# Install ZSH
#-------------------------------------------------------------------------------

brew 'zsh'
brew 'zsh-completions'

#-------------------------------------------------------------------------------
# Install GNU core utilities (those that come with OS X are outdated)
#-------------------------------------------------------------------------------

brew 'coreutils'

#-------------------------------------------------------------------------------
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
#-------------------------------------------------------------------------------

brew 'findutils'

#-------------------------------------------------------------------------------
# Install Bash 4
#-------------------------------------------------------------------------------

brew 'bash'

#-------------------------------------------------------------------------------
# Install more recent versions of some OS X tools
#-------------------------------------------------------------------------------

brew 'homebrew/dupes/grep'

#-------------------------------------------------------------------------------
# Install Binaries
#-------------------------------------------------------------------------------

brew 'asciinema'
# brew 'awscli'
brew 'aws-elasticbeanstalk'
# brew 'autoconf'
brew 'ffmpeg'
brew 'git'
brew 'git-flow'
# brew 'git-stree' # deprecated
brew 'highlight'
brew 'htop'
brew 'httpie'
brew 'hub'
brew 'jmeter'
# brew 'latex2html'
brew 'libav'
brew 'mackup'
brew 'nano'
brew 'node@6', args: ['with-full-icu', 'with-npm']
brew 'openssl'
brew 'pandoc'
brew 'tcpdump'
brew 'thrift'
brew 'tree'
# brew 'trash'
brew 'wget'
brew 'youtube-dl'

#-------------------------------------------------------------------------------
# Development-PHP
# @see $ brew info php71, which reads...
# With the release of macOS Sierra the Apache module is now not built by default. 
# If you want to build it on your system you have to install php with the 
# --with-httpd24 option. See  brew options php71  for more details.
#-------------------------------------------------------------------------------

brew 'php71' #, args: ['without-apache']
brew 'php71-intl'
brew 'php71-mecab'
brew 'php71-redis'
brew 'php71-xdebug'
brew 'phpdocumentor'
brew 'composer'
brew 'phpunit'
brew 'php-cs-fixer'

#-------------------------------------------------------------------------------
# Development-Ruby
#-------------------------------------------------------------------------------

brew 'ruby'
brew 'rbenv'

#-------------------------------------------------------------------------------
# Development-Python (includes pip, easy_install)
#-------------------------------------------------------------------------------

brew 'python', args:['with-sphinx-doc']
brew 'python3', args:['with-sphinx-doc']
brew 'pyenv-virtualenv'

#-------------------------------------------------------------------------------
# Development-Go
#-------------------------------------------------------------------------------

brew 'golang'

#-------------------------------------------------------------------------------
# Development-Database
#-------------------------------------------------------------------------------

# brew 'mariadb'
brew 'mysql'
brew 'sqlite'

#-------------------------------------------------------------------------------
# Apps
#-------------------------------------------------------------------------------

# cask 'adapter'
# cask 'atom'
# cask 'balsamiq-mockups'
# cask 'calibre'
cask 'docker'
# cask 'docker-toolbox'
cask 'evernote'
cask 'firefox'
# cask 'github-desktop'
# cask 'gitkraken'
# cask 'goofy'
cask 'google-chrome'
cask 'google-drive'
cask 'intellij-idea'
cask 'iterm2'
# cask 'mactex'
# cask 'movist'
# cask 'pgadmin4'
cask 'phpstorm'
cask 'psequel'
cask 'obs'
cask 'rdm'
cask 'screenflow'
# cask 'screenhero'
cask 'sequel-pro'
# cask 'skype'
cask 'slack'
cask 'sublime-text'
# cask 'textual'
# cask 'tower'
# cask 'transmit'
# cask 'vagrant'
# cask 'virtualbox'
# cask 'virtualbox-extension-pack'
# cask 'vmware-fusion7'
cask 'wireshark'
# cask 'wkhtmltopdf'

#-------------------------------------------------------------------------------
# Quicklook
#-------------------------------------------------------------------------------

# cask 'qlcolorcode'
# cask 'qlmarkdown'
# cask 'quicklook-json'
# cask 'quicklook-csv'
# cask 'qlstephen'

#-------------------------------------------------------------------------------
# Fonts
#-------------------------------------------------------------------------------

# cask 'font-sauce-code-powerline'
cask 'font-source-code-pro'
# cask 'font-source-sans-pro'
# cask 'font-source-serif-pro'
