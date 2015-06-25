# Public: Install Toggl.app into /Applications.
#
# Examples
#
#   include toggl
#
# TODO: switch source to the following, pending release of puppetlabs/puppet#2249
#   source   => 'https://www.toggl.com/api/v8/installer?app=td&platform=darwin&channel=stable'
#
class toggl {
  if file('/var/db/.puppet_appdmg_installed_Toggl', '/dev/null') =~ /https:\/\/download\.toggl\.com\/toggldesktop\/latest\/TogglDesktopInstaller_Release\.dmg/ {
    notice('Detected an old version of puppet-toggl (1.0.2 or older). The appdmg cookie will be removed so that the latest version of ToggleDesktop.app can be installed.')
    file {'/var/db/.puppet_appdmg_installed_Toggl':
      ensure => 'absent',
      before => Package['Toggl']
    }
  }
  package { 'Toggl':
    provider => 'appdmg',
    source   => 'http://assets.toggl.com/installers/TogglDesktop-7_1_121-2014-10-30-10-35-02.dmg'
  }
}
