require 'spec_helper'

describe 'opera::mail' do
  it do
    should contain_class('opera::mail')
    should contain_package('Opera-Mail').with({
      :provider => 'appdmg_eula',
      :source   => 'http://get.geo.opera.com/pub/opera/mail/1.0/mac/Opera-Mail-1.0-1040.i386.dmg'
    })
  end
end
