require 'bcrypt'
class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_and_belongs_to_many :followed_id,
              class_name: "User",
              join_table: :followers,
              foreign_key: :user_id,
              association_foreign_key: :followed_id

has_and_belongs_to_many :user_id,
              class_name: "User",
              join_table: :followers,
              foreign_key: :followed_id,
              association_foreign_key: :user_id

  # Remember to create a migration!
  has_many :posts
  include BCrypt

  def password
    @password ||= Password.new(digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.digest = @password
  end

end
