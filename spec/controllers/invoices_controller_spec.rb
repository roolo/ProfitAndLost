require 'spec_helper'

describe InvoicesController, :type => :controller do
  render_views

  describe 'index' do
    it 'informs about BA credentials' do
      user_with_credentials = FactoryGirl.create :user
      sign_in user_with_credentials

      get :index

      expect(response.body).to have_text('Please fill up your Billapp credentials.')
    end

    it 'loads data when BA credentials available' do
      user_with_credentials = FactoryGirl.create :user, :with_ba_credentials
      sign_in user_with_credentials


      get :index
      invoices = Remote::Billapp::Invoice.all.map(&:number)

      expect(response.body).to have_text(invoices.first)
      expect(response.body).to have_text(invoices.second)
    end


  end
end
