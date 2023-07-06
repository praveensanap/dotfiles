# Install dotfiles
ls -p | grep -v / | grep dot- | cut -d '-' -f 2 | xargs -n 1 -I {} ln -s -f `pwd`/dot-{} ~/.{}
ls -p | grep / | grep dot- | cut -d '-' -f 2 | cut -d '/' -f 1 | xargs -n 1 -I {} sh -c '[ ! -e ~/.{} ] && ln -s -f `pwd`/dot-{} ~/.{}'

git submodule init
git submodule update
ln -s `pwd`/tmux/.tmux.conf ~/.tmux.conf

# Setup git
git config --global url."git@github.com:".insteadOf "https://github.com/"
git config --global core.excludesfile ~/.gitignore_global

# Install fzf
yes | /usr/local/opt/fzf/install
