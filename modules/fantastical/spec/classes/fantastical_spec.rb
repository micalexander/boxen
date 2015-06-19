require 'spec_helper'

describe 'fantastical' do
  it do
    should contain_package('Fantastical').with({
      :source   => 'http://flexibits.com/fantastical/download',
      :provider => 'compressed_app'
    })
  end
end
