class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :title, :descriotion, presence: true 
end
