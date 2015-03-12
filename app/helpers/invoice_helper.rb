module InvoiceHelper
  def balance_class balance
    if balance > 0
      'balance-good'
    elsif balance < 0
      'balance-bad'
    end
  end
end
