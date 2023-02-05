require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'UserProfiles', type: :request do
  let(:u) { create(:user) }
  let(:user_pf) { create(:user_profile, user: u) }
  before do
    user_pf
    sign_in(u)
  end
  describe 'GET /add' do
    let(:u2) { create(:user, email: 'test@def.com') }
    before do
      sign_out(u)
      sign_in(u2)
    end
    it 'returns http success' do
      get '/user_profile/add'
      expect(response).to have_http_status(:success)
    end
    it 'returns http success' do
      create(:user_profile, user: u2)
      get '/user_profile/add'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/user_profile/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/user_profile/show'
      expect(response).to have_http_status(:success)
    end
  end
end
# rubocop:enable Metrics/BlockLength
