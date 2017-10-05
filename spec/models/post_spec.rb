require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to belong_to(:author) }
  end
end
