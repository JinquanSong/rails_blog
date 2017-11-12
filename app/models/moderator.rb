class Moderator < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :fullname, :username, presence: true
  validates :username, format: { with: /@/, message: 'is not valid'}

end
