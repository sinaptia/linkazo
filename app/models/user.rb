class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :links, -> { order(:position) }, dependent: :destroy, inverse_of: :user
  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :display_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :theme_primary_color, format: { with: /\A#[0-9A-Fa-f]{6}\z/ }, allow_blank: true
  validates :theme_secondary_color, format: { with: /\A#[0-9A-Fa-f]{6}\z/ }, allow_blank: true

  before_validation :generate_username, on: :create
  before_validation :set_default_display_name, on: :create

  def font_family
    theme_font_family.presence || "Inter"
  end

  def primary_color
    theme_primary_color.presence || "#3B82F6"
  end

  def secondary_color
    theme_secondary_color.presence || "#1F2937"
  end

  def to_param
    username
  end

  private

  def generate_username
    return if username.present?

    base_username = email.split("@").first.gsub(/[^a-zA-Z0-9_]/, "_")
    counter = 1
    potential_username = base_username

    while User.exists?(username: potential_username)
      potential_username = "#{base_username}#{counter}"
      counter += 1
    end

    self.username = potential_username
  end

  def set_default_display_name
    return if display_name.present?

    self.display_name = email.split("@").first.titleize
  end
end
