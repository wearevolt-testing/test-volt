class Post < ApplicationRecord
  belongs_to :author, polymorphic: true

  validates :title, :body, presence: true

  before_create :set_published_at

  private

  def set_published_at
    self.published_at = Time.zone.now
  end
end
