require 'spec_helper'

describe 'spotify' do
  it do
    should contain_package('Install Spotify').with({
      :provider => 'compressed_app',
      :source   => 'http://download.spotify.com/SpotifyInstaller.zip',
    })
  end

  it do
    should contain_exec('Install Spotify').with({
      :command     => "/usr/bin/open /Applications/Install\\ Spotify.app",
      :logoutput   => 'on_failure',
      :refreshonly => 'true',
    })
  end

  it do
    should contain_file('/Applications/Install\ Spotify.app').with({
      :ensure => 'absent',
    })
  end
end
