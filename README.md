# Connor's Dotfiles

To install a package:
```bash
stow zsh
```

## Firefox
Theme: [Catppuccin](https://github.com/catppuccin/firefox)

Extensions:
- Sidebery

### Hide the tab bar
1. Setup [FirefoxCSS](https://github.com/FirefoxCSS-Store/FirefoxCSS-Store.github.io/blob/main/README.md#generic-installation).
2. Put this in `${PROFILE}/chrome/userChrome.css` (create the file if it doesn't already exist):
```
#TabsToolbar
{
    visibility: collapse;
}
```

## TODO
- [ ] Organise shortcuts
    - [ ] Gitsigns
    - [ ] Copilot chat
    - [/] LSP
    - [ ] Whichkey
- [ ] Organise plugins into folders and give languages seperate folders.
    - [ ] Lua
    - [ ] Scala
- [ ] Support Java
