class CreateUsersPosts < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :digest
      t.timestamps null: false
    end
    create_table :followers do |t|
      t.integer :user_id
      t.integer :followed_id
    end
    add_index(:followers, [:user_id, :followed_id], :unique => true)
    add_index(:followers, [:followed_id, :user_id], :unique => true)

    create_table :posts do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :post
    end

  end
end
