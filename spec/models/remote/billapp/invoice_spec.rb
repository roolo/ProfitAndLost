require_relative '../../../spec_helper'

describe Remote::Billapp::Invoice, :type => :model do
  before :each do
    user = FactoryGirl.create :user, :with_ba_credentials

    Remote::Billapp::Base::set_ba_credentials user
  end


  describe '#all' do
    it 'returns all records' do
      call_result = Remote::Billapp::Invoice.all

      expect(call_result.count).to eq(2)
    end
  end

  describe '#find' do
    it 'finds invoice' do
      call_result = Remote::Billapp::Invoice.find(96765)

      expect(call_result.number).to eq('201500002')
    end
  end

end
