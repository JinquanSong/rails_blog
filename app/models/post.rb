class Post < ApplicationRecord
  belongs_to :moderator
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  scope :filter_by_tag, ->(tag_name) { includes(:tags).where(tags: {name: tag_name}) }
  scope :published, -> { where(publish: true) }
  scope :in_year, ->(year) {where("created_at BETWEEN ? AND ?", year.beginning_of_year, year.end_of_year) }

  validates :title, presence: true
  validates :content, presence: true

  def self.matching_title_or_content(search)
    where("title ilike ? OR content ilike ?", "%#{search}%", "%#{search}%")
  end

end
