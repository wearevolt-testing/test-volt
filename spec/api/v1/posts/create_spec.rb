require 'rails_helper'

describe 'Posts API::V1 POST /create' do
  let(:access_token) { create(:access_token) }

  it_behaves_like 'authorization_doorkeeper'

  def do_request(options = {})
    post '/api/v1/posts', as: :json,
                              params: { post: { title: 'Title', body: 'Body' } }
                                .merge(options)
  end
end
