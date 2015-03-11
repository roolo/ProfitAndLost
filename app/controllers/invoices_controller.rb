class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_billapp_credentials?
      @invoices = Remote::Billapp::Invoice.all
    end
  end

  def edit

  end
end
