require 'spec_helper'

describe 'transmit' do
  it do
    should contain_package('Transmit').with({
      :provider => 'compressed_app',
      :source   => 'http://www.panic.com/transmit/d/Transmit%204.4.5.zip'
    })
  end
end

