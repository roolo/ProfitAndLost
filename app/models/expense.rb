class Expense < ActiveRecord::Base
  include ActiveModel::Dirty

  belongs_to :invoice

  validates_presence_of :amount, :invoice

  after_save :recalculate_invoice_expenses

  private

  def recalculate_invoice_expenses
    invoice.recalculate_expenses
  end
end
