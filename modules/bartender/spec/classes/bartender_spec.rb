require 'spec_helper'

describe 'bartender' do
  it do
    should contain_package('Bartender').with(
      :provider => 'compressed_app',
      :source   => 'http://www.macbartender.com/Demo/Bartender.zip'
    )
  end
end
