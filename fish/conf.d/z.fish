set -g __fish_bookmark_dir $HOME/.local/share/bookmarks/

function zlist
  if test (count $argv) -eq 0
    set -l files (ls -1 (echo $__fish_bookmark_dir))
    if test (count $files) -ne 0
      zlist $files
    end
  else
    for val in $argv
      echo -e $val\t(readlink (echo $__fish_bookmark_dir)$val)
    end
  end
end

function z
  if test (count $argv) -eq 1
    cd (readlink $HOME/.local/share/bookmarks/$argv)
  else
    echo "Usage: z <name>"
  end
end

function zset
  if test (count $argv) -eq 2
    ln -s (realpath $argv[1]) $__fish_bookmark_dir$argv[2]
  else
    echo "Usage: zset <target> <name>"
  end
end
