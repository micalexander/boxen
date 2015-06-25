# Public: Install and configure your personal dotfiles
#
# Usage:
#
#   include dotfiles

class dotfiles(
  $dir      = $dotfiles::config::dir,
  $source   = $dotfiles::config::source,
  $prefix   = '',
  $suffix   = '',
  $symlinks = undef,
) inherits dotfiles::config {
  repository { $dir:
    source => $source
  }

  $defaults = {
    dir     => $dir,
    prefix  => $prefix,
    suffix  => $suffix,
    require => Repository[$dir],
  }

  if is_hash($symlinks) {
    create_resources(dotfiles::symlink, $symlinks, $defaults)
  } elsif is_array($symlinks) {
    ensure_resource(dotfiles::symlink, $symlinks, $defaults)
  }
}
