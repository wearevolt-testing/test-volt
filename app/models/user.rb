class User < ApplicationRecord
  has_many :posts, as: 'author', dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
end
