class Search < ApplicationRecord
  belongs_to :user
  validates :user, presence: false
end
