class Link < ApplicationRecord
  validates :url, :description, presence: true, length: { minimum: 5 }
  belongs_to :user
  alias_attribute :author, :user

  has_many :votes
end
