# ZorinLayoutsRevised
A script which simplifies the process of applying some Tweaks to the Zorin OS Desktop.

## this script currently handles:
- Automatically applying different Tweaks to the desktop through Gnome-Shell extensions, such as Pop-Shell or NoAnnoyance

## This script does NOT:
- Allow you to use or install Zorin's pro layouts on the Core variants (Please see Takedown.md for more information)
- Allow you to customize the lite editions

## Usage:
Simply paste this into your Terminal and hit `enter`:
```bash
bash -c "$(wget https://raw.githubusercontent.com/TGRush/ZorinLayoutsRevised/main/morelayoutsinstall.sh -O -)"
```

> ###### Note that this script is currently going a little bit of a re-work, thus some things might be broken at the moment.

---

## Contributing:
When contributing (or trying to), make sure that you've tested your changes before you make a pull request, and that you relatively know how to use bash and some command line tools (wget for example, unzip, the gnome-extensions cli tool, etc) and that the change you're trying to pull request actually fits the project 

#### Changes which are considered NOT fitting the project:
- untested changes
- outdated extensions
- extensions installed forcibly (as in, outdated or too new for current GNOME version and thus installed through force)
- changing dconf where unnecessary
- custom extension downloading (already available through extensions.gnome.org as well as Extension Manager on Flathub)
- changes without a clear way of reverting them (for example changing the Kernel version...for whatever reason)
- breaking changes (for example PPAs which prevent proper updating)

## License:
```
Copyright (c) 2022 Simon "TGRush" Müller

This software is provided 'as-is', without any express or implied warranty. 
In no event will the authors be held liable for any damages arising from the
use of this software.

Permission is granted to anyone to use this software for any purpose, 
including commercial applications, and to alter it and redistribute it freely, 
subject to the following restrictions:

  1. The origin of this software must not be misrepresented; 
  you must not claim that you wrote the original software. 
  If you use this software in a product, an acknowledgment 
  in the product documentation would be appreciated but is not required.

  2. Altered source versions must be plainly marked as such, 
  and must not be misrepresented as being the original software.

  3. This notice may not be removed or altered from any source distribution.
```