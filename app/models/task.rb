class Task < ApplicationRecord
  belongs_to :list
  validates :content, presence: true, length: { maximum: 60 }
  default_scope { order('priority ASC')}

 # after_save :set_default_priority

  def completed?
    !completed_at.blank?
  end

  private

 # def set_default_priority
 #  write_attribute(:priority, self.id)
 # end

end
