# ranger
`ranger` cli file manager

## Installation
```zsh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ranger
```

## Configuration
```zsh
ranger --copy-config=all
```

## macOS
Symlink  ~/.config/ranger/rc.conf and edit it adding support for image preview :)

In particular, look for these options and set them accordingly
set preview_images true
set preview_images_method iterm2

## Trash
`ranger` deletes files as rm, by default. we don't want that then to `trash` files instead of deleting them
map <F8> console shell /usr/local/bin/trash%space%s
