require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to belong_to(:commentable) }
  end

  context 'callbacks' do
    let(:author) { create(:user) }
    let(:post) { create(:post, author: author) }
    let!(:comment) { create(:comment, commentable: post) }

    it 'published_at auto save after create post' do
      comment.reload
      expect(comment.published_at.to_s).to match(%r{^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.*})
    end
  end
end
