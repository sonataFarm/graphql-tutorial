class Link < ApplicationRecord
  belongs_to :user
  alias_attribute :author, :user

  has_many :votes
end
