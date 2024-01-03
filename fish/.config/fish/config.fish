# silencia as boas vindas
set fish_greeting

fish_vi_key_bindings

# emula o comportamento do cursor do vim
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

# fonts
set -g theme_nerd_fonts yes

# plugins 
fish_ssh_agent

# gpg
set -gx GPG_TTY (tty)

# node
nvm use 20 > /dev/null

# java
set --export JAVA_HOME (dirname (dirname (readlink -f (which java))))
set -gx PATH $JAVA_HOME $PATH
