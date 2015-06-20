require 'spec_helper'

describe 'divvy' do
  it do
    should contain_package('Divvy').with({
      :provider => 'compressed_app',
      :source   => 'http://mizage.com/downloads/Divvy.zip',
    })
    should contain_file('/private/var/db/.AccessibilityAPIEnabled').with({
      :ensure => 'file',
    })
  end
end
