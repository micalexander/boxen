# Public: Create a symlink to the dotfile
#
# Usage:
#
#   dotfiles::symlink { 'example': }

define dotfiles::symlink(
  $dir,
  $file   = ".${title}",
  $prefix = '',
  $suffix = '',
) {
  $home   = "/Users/${::boxen_user}"
  $source = "${home}/${file}"
  $target = "${dir}/${prefix}${title}${suffix}"

  file { $source:
    ensure => 'link',
    target => $target,
  }
}
