# Pop!_OS 24.04 COSMIC DE Dark/Light Theme Shortcut
I got tired of going to the settings to switch between themes, so I made a simple script, bash alias, and custom shortcut. This is a guide so you can do it too. If there is already a shortcut (there used to be) and I wasted my time... Oh well...

Before you get started, here are my assumptions:
1. You use Bash and a relatively standard COSMIC desktop environment on Pop!_OS 24.04.
2. System76 has not yet added a toggle shortcut.
3. This script edits a config file directly, if System76 changes how themes are stored, the script may need updating.

If you *uninstalled Bash* (..?), change the shebang so it's POSIX sh:
```sh
#!/bin/sh
set -eu
```

You can *skip* the alias steps if you *only want to use the keyboard shortcut* and don't plan on running the command from the terminal.

***Let's get started.***

## 1. Clone to home dir
Clone this repo to your home directory for easiest setup.
```bash
cd ~
git clone https://github.com/joshua-hvmn/pop-cosmic-dark-light-shortcut.git
cd pop-cosmic-dark-light-shortcut
```
If you have SSH set up: `git@github.com:joshua-hvmn/pop-cosmic-dark-light-shortcut.git`

Make sure the script is executable (run from same directory script is in):
```bash
chmod +x toggle-dark.sh
```

## 2. Move or copy the alias (optional)
You only need the alias if you want to run `toggle-theme` from a shell. Just run the command below, it will handle the decision. You can safely skip this step if you don't need/want the command (just use the shortcut).

If you already have a `.bash_aliases` file, copy and paste the alias in the included file into yours.

If you don't already have one, move the `.bash_aliases` file into your home directory so `.bashrc` can see it (files with a . at the beginning are hidden, click 'Show Hidden Files' in View).

Run this command to copy or append the aliases file:
```bash
cp -n .bash_aliases ~/ || (printf "\n" >> ~/.bash_aliases && cat .bash_aliases >> ~/.bash_aliases)
```

## 3. Make sure the alias or script works
#### If you added the Bash alias:
Run the command to ensure the paths are right and the script works.

Refresh terminal if it's open: `source ~/.bashrc`
```bash
toggle-theme
```

#### If you are skipping the alias:
Simply run the script from its directory:
```bash
./toggle-dark.sh
```

#### Result:
It should switch between dark and light mode and post a temporary notification.

## 4. Add the custom shortcut COSMIC
Open the keyboard settings.
```bash
cosmic-settings keyboard
```

Click "View and customize shortcuts" under "Keyboard Shortcuts"

Click "Custom" > "Add shortcut" 

Name it "Toggle Dark Theme" or whatever you want.

Under command, put `~/pop-cosmic-dark-light-shortcut/toggle-dark.sh`, or change the path if you put the script in a different location *(For example: I use '~/.scripts/bash/toggle-dark.sh', also in the alias)*

Add a control keybinding, I use Super+Shift+t.

This is intended to be the main way to use the script.

------
That's all, it should work if your file paths are correct. Hope it helps!