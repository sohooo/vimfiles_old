# vimfiles

Dieses Repository beinhaltet eine Vim 7+ Konfiguration mit einer Reihe an Plugins. Pathogen ermoeglicht das Laden der im Ordner `.vim/bundles` fein saeuberlich getrennten Plugins.


# Installation

    cd; git clone <remote url>/vimfiles.git .vimfiles

Symlink fuer `.vim` Ordner erstellen. Die Settings sollen jedoch nur fuer `vim` aktiv werden, und nicht fuer den normalen `vi`, da 7++ Features verwendet werden.

    ln -s .vimfiles/.vim


# Anwendung

Um nun erweiterte Features mit `vim` zu verwenden, Vim 7+ installieren und folgenden Eintrag in die `.bashrc` hinzufuegen:

    # in ~/.bashrc:
    alias v="vim -u ~/.vimfiles/.vimrc"
    
    # Vim 7 verwenden:
    v <file>


# Einige Shortcuts

## Plugins
* `,d`: toggle NERDTree
* `,t`: toggle Taglist
* `,y`: Yankring Window
* `gcc`: toggle Comment on/off

## Fenster
* `CTRL-h`: vorheriger Tab
* `CTRL-l`: naechster Tab

## Suche mit EasyGrep
* `,vv`: sucht Wort unter Cursor
* `,vr`: replace Wort unter Cursor
* `,vo`: EasyGrep Options
* `:cw`: Ergebnisliste
* `ctrl+w enter`: Treffer in CW oeffnen

## Sonstiges
* `F9`: toggle paste/nopaste
* `F10`: toggle number/nonumber
* `,c`: toggle Colorscheme settings
* `,h`: remove search highlights
* `jj`: remap von ESC; this rox!






