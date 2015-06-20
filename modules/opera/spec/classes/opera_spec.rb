require 'spec_helper'

describe 'opera' do
  it do
    should contain_class('opera')
    should contain_package('Opera').with({
      :provider => 'appdmg_eula',
      :source   => 'http://get.geo.opera.com/pub/opera/desktop/21.0.1432.67/mac/Opera_21.0.1432.67_Setup.dmg'
    })
  end
end
