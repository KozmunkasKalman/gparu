# GParu

TUI/CLI frontend for [Paru](https://github.com/Morganamilo/paru) AUR helper

## Installation
``wget https://raw.githubusercontent.com/KozmunkasKalman/gparu/main/install.sh && chmod +x install.sh && ./install.sh``

## Usage
By default it opens an interactive fzf, unless given arguments
``$ gparu                                - interactive TUI with fzf``
``$ gparu {i install -i -S} [package(s)] - install package(s)``
``$ gparu {u update -u -Syu}             - update installed packages``
``$ gparu {r remove -r -R} [package(s)]  - remove installed package(s)``
``$ gparu {c clear-cache -c -Scc}        - clear cached files``
``$ gparu {h help -h}                    - prints help text``