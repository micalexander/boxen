require 'spec_helper'

CLASSES = {
  'xscope' => 'http://iconfactory.com/assets/software/xscope/xScope-3.5.2.zip',
  'xscope::2' => 'http://iconfactory.com/assets/software/xscope/xScope_251.zip'
}

CLASSES.each do |klass, source|
  describe klass do
    it do
      should contain_package('XScope').with({
        :provider => 'compressed_app',
        :source   => source
      })
    end
  end
end
