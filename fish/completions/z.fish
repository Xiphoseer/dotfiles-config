set -g __fish_bookmark_dir $HOME/.local/share/bookmarks/

function __fish_z_bookmark
  for val in $argv
    echo -e $val\t(readlink (echo $__fish_bookmark_dir)$val)
  end
end

function __fish_z_bookmarks
  __fish_z_bookmark (ls -1 (echo $__fish_bookmark_dir))
end

complete -c z -fa '(__fish_z_bookmarks)'
