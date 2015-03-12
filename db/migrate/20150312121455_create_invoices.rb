class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :ba, index: true
      t.decimal :total_expenses, default: 0
      t.integer :ba_number

      t.timestamps
    end

    create_table :expenses do |t|
      t.references  :invoice, index: true
      t.decimal     :amount

      t.timestamps
    end
  end
end
