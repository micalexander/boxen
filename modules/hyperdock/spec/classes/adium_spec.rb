require 'spec_helper'

describe 'hyperdock' do

  it { should contain_class('hyperdock') }
  it { should contain_package('hyperdock').with_provider('appdmg') }
  it { should contain_package('HyperDock').with_source('http://hyperdock.bahoom.com/HyperDock.dmg') }

end
