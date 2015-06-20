require 'spec_helper'

describe 'imageoptim' do
  it do
    should contain_package('ImageOptim').with({
      :provider => 'compressed_app',
      :source   => 'http://imageoptim.com/ImageOptim.tbz2',
      :flavor   => 'tbz'
    })
  end
end
