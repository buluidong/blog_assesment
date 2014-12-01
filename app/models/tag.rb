class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :entries
  has_many :posts, :through => :entries

  validates :name, presence: true
end
