class Message < ApplicationRecord
  belongs_to :visitor

  validates :content, presence: true

  def self.matching_fullname_or_content(term)
    joins(:visitor).where("fullname ilike ? OR content ilike ?", "%#{term}%", "%#{term}%")
  end

  def mark_read
    update(status: true) unless status
  end
end
