class Post < ApplicationRecord
  belongs_to :author, polymorphic: true

  validates :title, :body, presence: true
end
