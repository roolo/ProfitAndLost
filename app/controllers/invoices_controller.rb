class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_billapp_credentials?
      @invoices = Remote::Billapp::Invoice.all
    end
  end

  def edit
    begin
      @invoice = Remote::Billapp::Invoice.find(params[:id])
    rescue ActiveResource::ResourceNotFound
      redirect_to invoices_path, error: t('.invoice_not_found')
    end
  end
end
