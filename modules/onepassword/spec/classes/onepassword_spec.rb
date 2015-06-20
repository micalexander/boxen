require 'spec_helper'

describe 'onepassword' do

  it do
    should contain_package('1Password 4').with({
      :provider => 'compressed_app',
    })
  end

end
