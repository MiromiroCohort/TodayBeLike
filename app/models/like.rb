class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :post
  validates :user_id, uniqueness: {scope: :post_id}
  # validates :user_id, presence: true 
end
 