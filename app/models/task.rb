class Task < ApplicationRecord
  belongs_to :list
  validates :content, presence: true, length: { maximum: 60 }
  default_scope { order('priority ASC')}

  def completed?
    !completed_at.blank?
  end

end
