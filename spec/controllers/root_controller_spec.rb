require 'spec_helper'

describe RootController, :type => :controller do
  render_views

  describe 'GET index' do
    it 'returns http success' do
      get 'index'
      expect(response).to be_success
    end
  end

end
