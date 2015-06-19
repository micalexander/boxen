require 'spec_helper'
# Rename this file to classname_spec.rb
# Check other boxen modules for examples
# or read http://rspec-puppet.com/tutorial/
describe 'teamviewer' do
  it do
    should contain_package('TeamViewer').with({
		  :provider => 'pkgdmg',
    	:source   => 'http://download.teamviewer.com/download/TeamViewer.dmg',
    })
  end
end
