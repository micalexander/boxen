# Public: Install Hazel.dmg to /Applications.
#
# Examples
#
#    include hazel
class hazel {
  $pref_pane_dir = "/Users/${::luser}/Library/PreferencePanes"
  $pref_pane_name = "Hazel.prefPane"
  $install_dir = "/tmp"
  $dmg = "Hazel-3.3.5.dmg"

  exec { 'hazel-download':
    cwd => $install_dir,
    command => "curl -OLs https://s3.amazonaws.com/Noodlesoft/${dmg}",
    creates => "${install_dir}/${dmg}",
    subscribe => Exec['hazel-mount'],
    refreshonly => true
  }

  exec { 'hazel-mount':
    cwd => $install_dir,
    command => "yes | hdiutil mount Hazel-3.3.5.dmg > /dev/null",
    subscribe => Exec['hazel-install'],
    refreshonly => true
  }

  exec { 'hazel-install':
      #    command => "cp -R /Volumes/Hazel/${$pref_pane_name} ${pref_pane_dir}/",
    command => "open /Volumes/Hazel/${$pref_pane_name}",
    creates => "${pref_pane_dir}/${pref_pane_name}",
    notify => Exec['hazel-unmount']
  }

  exec { 'hazel-unmount':
    command => "hdiutil unmount /Volumes/Hazel/",
    refreshonly => true
  }
}
