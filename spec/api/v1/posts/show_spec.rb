require 'rails_helper'

describe 'Posts API::V1 GET /show' do
  let(:user)    { create(:user) }
  let(:post)    { create(:post, author: user) }
  let(:post_id) { post.id }

  let(:subject) { get "/api/v1/posts/#{post_id}", as: :json }

  it 'return json' do
    subject
    expect(response.body).to include_json(
      title: post.title,
      body: post.body,
      author_nickname: user.nickname,
      id: post.id,
      published_at: %r{^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.*}
    )
  end

  context 'post not found' do
    let(:post_id) { Post.count.next }

    it 'return json with only error field' do
      subject
      json = JSON.parse(response.body)
      expect(json.size).to eq 1
      expect(json['errors']).not_to be_nil
    end
  end
end
