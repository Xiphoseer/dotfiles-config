set -g __fish_bookmark_dir $HOME/.local/share/bookmarks/

function z
  cd (readlink $HOME/.local/share/bookmarks/$argv)
end
