require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to belong_to(:author) }
  end

  context 'callbacks' do
    let(:author) { create(:user) }
    let(:post) { create(:post, author: author) }

    it 'published_at auto save after create post' do
      reload_post = Post.find post.id
      post = reload_post
      expect(post.reload.published_at.to_s.first(-9)).to eq post.created_at.to_s.first(-9)
    end
  end
end
