module Published
  extend ActiveSupport::Concern

  included do
    before_create :set_published_at
  end

  def set_published_at
    self.published_at = Time.zone.now unless published_at
  end
end
