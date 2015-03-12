require 'spec_helper'

describe ApplicationHelper, :type => :helper do
  describe '#bootstrap_label_class' do
    it 'should return correct CSS class' do
      expect(helper.bootstrap_label_class('alert')).to eq 'danger'
    end

    it 'should return given CSS class when it is uknown' do
      expect(helper.bootstrap_label_class('frkul')).to eq 'frkul'
    end
  end
end
