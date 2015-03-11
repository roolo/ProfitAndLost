require 'spec_helper'

feature 'Invoices loading', :type => :feature do
  scenario 'User visits invoices with BA credentials' do
    user_with_credentials = FactoryGirl.create :user
    form_sign_in user_with_credentials

    visit invoices_index_path

    expect(page).to have_text('Please add you Billapp credentials.')
  end
end
