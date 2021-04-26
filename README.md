# Emacs configuration #

This git repository tracks the `~/.emacs.d/` dir.

Its main purpose is track changes in the `init.el` config file, and theme configuration.

## Instructions ##

**Install**

1. Clone this repository into your `~/.emacs.d/`;
1. When emacs is run, selected packages are auto-installed with `use-package`;
1. Accept permission to use the custom theme:
    - currently `zerodark-theme`;
    - The theme hash updates every time you upgrade the theme pkg, so it is not versioned here;
    - This will show up as a 3 lines block `(custom-safe-themes)` and includes the hashes for all custom themes you accepted as safe;

**Refresh**

1. Close emacs
1. Rename or remove .emacs.d/elpa
1. Start emacs and grab a cup of coffee
