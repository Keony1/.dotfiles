Cloning:

```bash
git clone --bare https://github.com/$USER/dotfiles.git $HOME/.dotfiles
```

defining alias in the current shell scope

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

checkout the actual content from the git repository to $HOME

```bash
dotfiles checkout
```
