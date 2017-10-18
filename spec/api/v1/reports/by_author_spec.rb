require 'rails_helper'

describe 'Posts API::V1 POST /create' do
  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id).token }
  let(:form_params) { {} }

  let(:subject) do
    post '/api/v1/reports/by_author', as: :json,
                                      params: {
                                        start_date: Date.today.-(3).to_s,
                                        end_date: Date.today.to_s,
                                        email: 'admin@hero.com',
                                        access_token: access_token
                                      }
  end

  it_behaves_like 'authorization_doorkeeper'

  it 'init create_report service' do
    expect_any_instance_of(CreateReportService).to receive(:call).and_call_original
    subject
  end
end
