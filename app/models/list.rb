class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :title, :descriotion, presence: true 
end
