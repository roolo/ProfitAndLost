require 'spec_helper'

RSpec.describe Invoice, type: :model do
  describe 'Creation' do
    it 'creates record' do
      invoice = FactoryGirl.create :invoice

      expect(invoice.id).to be_integer
    end
  end
end
