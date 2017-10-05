class Comment < ApplicationRecord
  include Published
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true
end
