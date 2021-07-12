![dotfiles](https://media.giphy.com/media/K6nPw4pe3r6Bq/giphy.gif)

# dotfiles

![image](https://user-images.githubusercontent.com/6207785/125364604-b3f2bb80-e36a-11eb-9d0d-b533a87c2520.png)

## Dependencies

- [GNU Stow](https://www.gnu.org/software/stow/)
- [GitHub's CLI](https://github.com/cli/cli)
- [Alacritty](https://github.com/alacritty/alacritty)
- [zsh](https://askubuntu.com/a/131838)
- [prezto](https://github.com/sorin-ionescu/prezto)
- [fzf](https://github.com/junegunn/fzf)
- [Starship](https://starship.rs/)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) (>= 0.5,
  **very important**)

## Getting started

- Set ZSH as the default shell

```bash
chsh -s $(which zsh)
logout
```

- Install [GNU Stow](https://www.gnu.org/software/stow/)
- Install [GitHub's CLI](https://github.com/cli/cli)

- Setup dotfiles

```bash
gh repo clone rentziass/dotfiles ~/dotfiles
cd ~/dotfiles
./install
exit
```

- Setup (Neo)Vim ([after installing it](https://github.com/neovim/neovim/wiki/Installing-Neovim)).
  [packer]() (the plugin manager of choice should be installed automatically
  after running `vim` for the first time). After vim has started these commands
  need to run

```bash
:PackerCompile
:PackerInstall
```

- Install [Tmux](https://github.com/tmux/tmux/wiki)
- Install [fzf](https://github.com/junegunn/fzf)

- Start a new session, `ctrl + f` and start :shipit: (assuming you keep your
  projects in `~/dev` :trollface:)
