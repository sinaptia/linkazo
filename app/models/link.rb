class Link < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :position, presence: true, uniqueness: { scope: :user_id }
  validates :description, length: { maximum: 200 }

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:position) }

  before_validation :set_position, on: :create
  before_validation :normalize_url

  private

  def normalize_url
    return if url.blank?

    self.url = url.strip
    self.url = "https://#{url}" unless url.match?(%r{\Ahttps?://})
  end

  def set_position
    return if position.present?

    max_position = user.links.maximum(:position) || 0
    self.position = max_position + 1
  end
end
