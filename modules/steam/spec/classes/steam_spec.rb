require 'spec_helper'

describe 'steam' do
  it do
    should contain_package('Steam').with({
      :source   => 'http://media.steampowered.com/client/installer/steam.dmg',
      :provider => 'appdmg_eula'
    })
  end
end
