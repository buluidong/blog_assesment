class Entry < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tag
  belongs_to :post


  validates :post_id, presence: true
  validates :tag_id, presence: true
end
