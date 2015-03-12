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

  describe 'edit' do
    it 'shows invoice informations' do
      user_with_credentials = FactoryGirl.create :user, :with_ba_credentials
      sign_in user_with_credentials

      get :edit, id: 96765
      invoice = Remote::Billapp::Invoice.find(96765)

      expect(response.body).to have_text(invoice.number)
      invoice.lines.each do |il|
        expect(response.body).to have_text(il.quantity)
        expect(response.body).to have_text(il.unit_price)
      end
    end

    it 'fails with not existing id' do
      user_with_credentials = FactoryGirl.create :user, :with_ba_credentials
      sign_in user_with_credentials

      get :edit, id: 9

      expect(response).to redirect_to invoices_path
    end
  end
end
