# Dotfiles Puppet Module for Boxen

Install and configure your dotfiles with ease.

## Usage

```puppet
include dotfiles
```

## Hiera configuration

The following variables may be automatically overridden with Hiera:

``` yaml
dotfiles::dir:      "${boxen::config::srcdir}/dotfiles"
dotfiles::source:   "${::github_login}/dotfiles"

# Configure some defaults for your dotfile repository
dotfiles::prefix:   "."
dotfiles::suffix:   ".symlink"

# Use an array to create symlinks using the default variables
dotfiles::symlinks:
  - editorconfig
  - zshrc

# Use a hash to be more explicit with individual symlinks (will use defaults too)
dotfiles::symlinks:
  zshrc:
    prefix: zsh/
    suffix: .symlink
```

## Required Puppet Modules

* `boxen`
* `repository`
* `stdlib`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
