class Invoice < ActiveRecord::Base
  has_one :remote_invoice, class_name: 'Remote::Billapp::Invoice'
  has_many :expenses

  validates_presence_of   :ba_id, :ba_number
  validates_uniqueness_of :ba_id, :ba_number

  def recalculate_expenses
    self.reload
    self.total_expenses = expenses.inject(0.0) do |memo, expense|
      memo += expense.amount

      memo
    end

    self.save
  end
end
