class User < ApplicationRecord
  has_secure_password

  has_many :ideas, dependent: :nullify
  has_many :reviews, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
