![dotfiles](https://media.giphy.com/media/K6nPw4pe3r6Bq/giphy.gif)

# dotfiles
![image](https://user-images.githubusercontent.com/6207785/125364604-b3f2bb80-e36a-11eb-9d0d-b533a87c2520.png)

## New to Vim?

- [Learning Vim in a Week](https://mikecoutermarsh.com/boston-vim-learning-vim-in-a-week/)
- [Upcase: The Art of Vim](https://upcase.com/vim)

## Clone the repo

Clone this repo (or your own fork!) to your **home** directory (`/Users/username` on macOS and `home/username` for Debian-based).

```
$ cd ~
$ git clone https://github.com/rentziass/dotfiles
```

## Install [RCM](https://github.com/thoughtbot/rcm)

### on macOS, using `homebrew`

```
$ brew tap thoughtbot/formulae
$ brew install rcm
```

### on Debian-based

```
$ wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
$ echo "deb http://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
$ sudo apt-get update
$ sudo apt-get install rcm
```

If you're using a different OS, refer to [RCM docs](https://github.com/thoughtbot/rcm) for further info.

### Run RCM

This command expects that you cloned your dotfiles to `~/dotfiles/`

```
$ env RCRC=$HOME/dotfiles/rcrc rcup
```

RCM creates dotfile symlinks (`.vimrc` -> `/dotfiles/vimrc`) from your home directory to your `/dotfiles/` directory.

## Installing Vim Plugins

Plugins are listed in `vimrc.bundles`.

To install them you'll need vundle. Installation directions are here: https://github.com/gmarik/Vundle.vim.
Once vundle is installed, open vim (`$ vim`) and type `:PluginInstall`. And then restart vim. You'll need to do this for all the plugins to work.

### Git Config

Make sure you update `gitconfig` with your own name and email address. Otherwise you'll be committing as me. :smile_cat:

#### Custom Fonts

You'll need to use a custom font for Airline to look nice. (Seeing weird symbols? This is why!). See here: https://github.com/Lokaltog/powerline-fonts
I use sourcecode pro. Once installed, go into iterm2 and Profiles > Text. Change both fonts.

### Recommended

**iterm2**
Use iterm2 instead of Terminal: http://iterm2.com/

There are two themes available for iterm2 inside this repository. Both solarized dark and light (to match vim!) Take a look at the `iterm2` directory.

**Vim with lua support** Reinstall Vim with `lua` to boost neocomplete performance. You need install macvim first ([more info here](https://coderwall.com/p/c4hk6w/enable-vim-with-lua-support)) so run

```
brew install macvim --with-lua
brew install vim --with-lua
```

**the_silver_searcher** Install [the_silver_searcher](https://github.com/ggreer/the_silver_searcher#installing) to really, REALLY increase your searches performance (eg: vim fuzzy finder), by running

```
brew install the_silver_searcher
```

**prezto**
I use `zsh` with `prezto` instead of Bash. Info & installation instructions [here](https://github.com/ggreer/the_silver_searcher#installing)

**Tmux**

```
$ brew install tmux
$ brew install reattach-to-user-namespace
```

---

These are a heavily modified version of Thoughtbot's dotfiles. More detailed instructions are available here: http://github.com/thoughtbot/dotfiles.

#### Contributing

Did you have trouble installing this? Could I make the documentation better? Let me know [@rentziass](http://twitter.com/rentziass). Or please fork & create a pull request with your suggestions.
