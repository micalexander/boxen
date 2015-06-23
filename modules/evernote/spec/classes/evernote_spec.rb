require 'spec_helper'

describe 'evernote' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_package('evernote').with({
      :source   => 'https://evernote.com/download/get.php?file=EvernoteMac&boxen=/evernote_latest.dmg',
      :provider => 'appdmg_eula'
    })
  end
end
