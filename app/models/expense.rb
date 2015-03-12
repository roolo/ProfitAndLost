class Expense < ActiveRecord::Base
  include ActiveModel::Dirty

  belongs_to :invoice

  validates_presence_of :amount, :invoice

  after_save :recalculate_invoice_expenses

  # def balance unit_count, unit_price, vat_price
  # @param [Remote::Billapp::Invoice::Line] il
  def balance il
    counting_result = (
      ( il.quantity * il.unit_price ) * ( ( il.vat / 100 ) + 1.0 )
    ) - amount

    counting_result.ceil(1)
  end

  private

  def recalculate_invoice_expenses
    invoice.recalculate_expenses
  end
end
