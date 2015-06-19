require 'spec_helper'

describe 'skitch::v1' do
  it do
    should contain_package('Skitch').with(
      :provider => 'compressed_app',
      :source   => 'http://get.skitch.com/Skitch-1.0.12.zip'
    )
  end
end
