require 'rails_helper'

describe 'Posts API::V1 GET /index' do
  let(:form_params) { { page: 1, per_page: 2 } }
  let(:user)        { create(:user) }
  let!(:posts)      { create_list(:post, 3, author: user) }
  let!(:post)       { create(:post, published_at: 2.days.ago, author: user) }

  let(:posts_as_json) do
    [post].push(*posts).map do |post_to_json|
      json_post = PostSerializer.new(post_to_json).as_json
      json_post[:published_at] = json_post[:published_at].to_s
      json_post
    end
  end

  subject { get '/api/v1/posts', as: :json, params: form_params }

  it 'return json array 1 page posts' do
    subject
    expect(response.body).to include_json(posts_as_json.first(2))
  end

  context 'page params no given' do
    let(:form_params) { {} }

    it 'return all post array' do
      subject
      expect(response.body).to include_json(posts_as_json)
    end
  end
end
