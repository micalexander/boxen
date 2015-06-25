require 'spec_helper'

describe 'dash' do
  it do
    should contain_package('Dash').with({
      :source   => 'http://kapeli.com/Dash.zip',
      :provider => 'compressed_app'
    })
  end
end
