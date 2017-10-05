class Post < ApplicationRecord
  include Published
  belongs_to :author, polymorphic: true
  has_many :comments, as: 'commentable', dependent: :destroy

  validates :title, :body, presence: true

  before_create :set_published_at
end
