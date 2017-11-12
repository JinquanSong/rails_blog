class Comment < ApplicationRecord
  include Notifiable

  belongs_to :post
  belongs_to :visitor
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :message, presence: true

  scope :approved, -> { where(status: true) }

  def self.matching_fullname_or_message(term)
    joins(:visitor).where("fullname ilike ? OR message ilike ?", "%#{term}%", "%#{term}%")
  end
end
