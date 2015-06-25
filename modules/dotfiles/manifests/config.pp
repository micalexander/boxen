# Public: Variables for working with dotfiles
#
# Usage:
#
#   require dotfiles::config

class dotfiles::config {
  include boxen::config

  $dir    = "${boxen::config::srcdir}/dotfiles"
  $source = "${::github_login}/dotfiles"
}
