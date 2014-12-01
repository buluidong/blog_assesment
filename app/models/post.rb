class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :entries
  has_many :tags, :through => :entries

  validates :title, presence: true
  validates :body, presence: true
end
