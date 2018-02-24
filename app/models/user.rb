class User < ApplicationRecord
  has_secure_password
  has_many :links

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return unless user
    return unless user.authenticate(password)

    user
  end
end
