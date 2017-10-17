require 'rails_helper'

describe 'Posts API::V1 POST /create' do
  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id).token }
  let(:form_params) { {} }

  let(:subject) do
    post '/api/v1/reports/by_author', as: :json,
                                      params: {
                                        start_date: 2.days.ago,
                                        end_date: Time.zone.now,
                                        email: 'admin@hero.com',
                                        access_token: access_token
                                      }
  end

  it_behaves_like 'authorization_doorkeeper'
end
