class Posting < ActiveRecord::Base
  validates :title, :description, :category_id, presence: true
  belongs_to :Category
end
