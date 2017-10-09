require 'rails_helper'

describe 'Posts API::V1 POST /create' do
  let(:access_token) { create(:access_token) }

  it_behaves_like 'authorization_doorkeeper'

  context 'valide attributies' do
    let(:attributies) { attributes_for(:post).merge(access_token: access_token.token) }

    it 'create new post' do
      expect do post '/api/v1/posts', as: :json, params: { post: attributies,
                                                           access_token: access_token.token } end
        .to change(Post, :count).by(1)
    end
  end

  def do_request(options = {})
    post '/api/v1/posts', as: :json,
                          params: { post: { title: 'Title', body: 'Body' } }
                            .merge(options)
  end
end
