require 'spec_helper'

describe 'opera::developer' do
  it do
    should contain_class('opera::developer')
    should contain_package('Opera-Developer').with({
      :provider => 'appdmg_eula',
      :source   => 'http://get.geo.opera.com/pub/opera-developer/23.0.1499.0/mac/Opera_Developer_23.0.1499.0_Setup.dmg'
    })
  end
end
