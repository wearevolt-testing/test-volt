class User < ApplicationRecord
  has_many :posts, as: 'author', dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  def by_author_index(date_range)
    raise ArgumentError if Date.parse(date_range.first) > Date.parse(date_range.last)

    condition = { published_at: date_range }
    posts_count = posts.where(condition).count
    comment_count = comments.where(condition).count

    (posts_count + comment_count) / 10.0
  end
end
