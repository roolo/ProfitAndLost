require 'spec_helper'

RSpec.describe Expense, type: :model do
  describe 'Creation' do
    it 'creates record' do
      expense = FactoryGirl.create :expense

      expect(expense.id).to be_integer
    end

    it 'recalculates Invoice expenses' do
      existing_invoice = FactoryGirl.create :invoice

      expect{
        FactoryGirl.create(:expense, invoice: existing_invoice, amount: 44.0)
        existing_invoice.reload
      }.to change{existing_invoice.total_expenses}.from(0).to(44.0)
    end
  end

  describe 'Update' do
    it 'recalculates Invoice expenses' do
      existing_invoice = FactoryGirl.create :invoice

      expenses = [
        FactoryGirl.create( :expense, invoice: existing_invoice, amount: 44.0 ),
        FactoryGirl.create( :expense, invoice: existing_invoice, amount: 58.30 )
      ]

      existing_invoice.reload

      expect{
        expenses[0].update amount: 50.70
        # Ensure result was persisted
        existing_invoice.reload
      }.to change{existing_invoice.total_expenses}.from(102.30).to(109.0)
    end
  end
end
