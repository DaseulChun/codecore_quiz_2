class Idea < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true
  validates :description, 
          presence: {message: "must exist"}
end
