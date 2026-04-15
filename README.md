# Private Homebrew Taps <img src="https://brew.sh/assets/img/homebrew-256x256.png" height="72">

This is a custom [Homebrew](https://brew.sh) tap various software.

## Setup

You can add the custom tap in a MacOS terminal session using:

```shell
brew tap abuxton/tap
# see Installing formulae below for helper function brew-list-formulae
brew install abuxton/tap/<name>
```

## Installing Formulae

Once the tap has been added, use the instructions below to install the software packages you need.

Current formulae include:

- `skillshub`
- `tf-slate`

### Installing the Latest formula

Thanks to <https://stackoverflow.com/a/68569754/2362673>

First install `jq`

```shell
brew install jq
```

Then add the following function to your .zshrc or equivalent (like .bashrc)

```shell
# Lists formulas from a given brew tap
# Call it with one or more taps to see their formulas
#   e.g.: brew-list-formulas tap/tap othertap/othertap
# Call it with no tap to list all taps
#   e.g.: brew-list-formulas
# Modified from https://stackoverflow.com/a/60607145/172272
function brew-list-formulas
{
  if (( $# == 0 )) then
    echo "Please specify one or more taps whose formulas you want listed.";
    echo "  e.g.: brew-list-formulas tap/tap othertap/othertap";
    echo "";
    echo "Available taps are:";
    echo "";
    brew tap;
  else
    echo "Formulas for tap(s) $* are:"
    echo "";
    brew tap-info --json "$@" | jq -r '.[]|(.formula_names[],.cask_tokens[])' | sort -V;
  fi
}
```

Usage

```shell
$ brew-list-formulas
Please specify one or more taps whose formulas you want listed.
  e.g.: brew-list-formulas tap/tap othertap/othertap

Available taps are:

abuxton/tap
...

$ brew-list-formulas abuxton/tap
Formulas for tap(s) abuxton/tap are:
...

```
