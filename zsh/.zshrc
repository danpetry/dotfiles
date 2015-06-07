source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
git
lein
command-not-found
ruby
rails
rake
gem
node
zsh-users/zsh-syntax-highlighting
EOBUNDLES

# Load the theme.
antigen theme powerline

# Tell antigen that you're done.
antigen apply
