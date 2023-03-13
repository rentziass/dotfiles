![dotfiles](https://media.giphy.com/media/K6nPw4pe3r6Bq/giphy.gif)

# dotfiles

![image](https://user-images.githubusercontent.com/6207785/125366414-e8b44200-e36d-11eb-9742-8d1dcfdbaf70.png)

## Dependencies

- [GNU Stow](https://www.gnu.org/software/stow/)
- [GitHub's CLI](https://github.com/cli/cli)
- [Alacritty](https://github.com/alacritty/alacritty)
- [zsh](https://askubuntu.com/a/131838)
- [prezto](https://github.com/sorin-ionescu/prezto)
- [fzf](https://github.com/junegunn/fzf)
- [Starship](https://starship.rs/)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) (>= 0.6.1,
  **very important**)
- A [NERD font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf) installed

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
- Install [Tmux](https://github.com/tmux/tmux/wiki)
- Install [fzf](https://github.com/junegunn/fzf)

- Start a new session, `ctrl + f` and start :shipit: (assuming you keep your
  projects in `~/dev` :trollface:)
