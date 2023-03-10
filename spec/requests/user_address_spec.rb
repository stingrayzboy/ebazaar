require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'UserAddresses', type: :request do
  let(:u) { create(:user) }
  let(:user_pf) { create(:user_profile, user: u) }
  before do
    user_pf
    sign_in(u)
  end
  describe 'GET /index' do
    it 'returns http success' do
      get '/user_addresses', xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/user_addresses/new', xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post user_addresses_path, params: { user_address: { address_line1: 'Line 1', address_line2: 'Line 2',
                                                               address_line3: 'Line 3', city: 'City', state: 'State',
                                                               pincode: '400241', country_code: '+91',
                                                               contact_number: '1234567890' } }, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

  describe 'create, update and destroy' do
    before do
      @address = create(:user_address, user_profile: u.user_profile)
    end
    describe 'GET /edit' do
      it 'returns http success' do
        get edit_user_address_path(@address.id), xhr: true

        expect(response).to have_http_status(:success)
      end
    end

    describe 'PATCH /update' do
      it 'returns http success' do
        patch user_address_path(@address.id), params: { user_address: { address_line1: 'Line 1',
                                                                  address_line2: 'Line 2',
                                                                  address_line3: 'Line 3', city: 'City', state: 'State',
                                                                  pincode: '400241', country_code: '+91',
                                                                  contact_number: '1234567890' } }, xhr: true
        expect(response).to have_http_status(:success)
      end
    end

    describe 'DELETE /destroy' do
      it 'returns http success' do
        delete user_address_path(@address.id), xhr: true
        expect(response).to have_http_status(:success)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
