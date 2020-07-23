class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id, null: false

      t.timestamps
    end
  end
end
