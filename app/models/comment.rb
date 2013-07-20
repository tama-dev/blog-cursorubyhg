class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :message
  validates :message, presence: true
end
