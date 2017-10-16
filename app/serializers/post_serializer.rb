class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_at, :author_nickname

  def author_nickname
    object.author.nickname
  end
  
  def published_at
    object.published_at.to_s
  end
end
