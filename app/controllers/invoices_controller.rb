class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_billapp_credentials?
      @invoices = Remote::Billapp::Invoice.all
    end
  end

  def edit
    begin
      @remote_invoice = Remote::Billapp::Invoice.find params[:id]
      @invoice = Invoice.find_by(ba_id: @remote_invoice.id)

      unless @invoice
        @invoice = Invoice.create!(
            ba_id:      @remote_invoice.id,
            ba_number:  @remote_invoice.number
          )

        # These two operations are separated for better debugging and
        #   readability
        @invoice.expenses = @remote_invoice.lines.map.with_index do |il, index|
          Expense.create! amount:   0,
                          ba_index: index,
                          invoice:  @invoice
        end
      end

      @invoice.reload

      @local_expenses = @invoice.expenses.inject([]) do |memo, expense|
        memo[expense.ba_index] = expense

        memo
      end
    rescue ActiveResource::ResourceNotFound
      redirect_to invoices_path, error: t('.invoice_not_found')
    end
  end

  def update
    local_invoice = Invoice.find params[:id]

    if local_invoice.update(invoice_params)
      redirect_to :back, notice:  t('update_success')
    else
      redirect_to :back, alert:   t('update_error')
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:id, expenses_attributes: [:id, :amount])
  end
end
