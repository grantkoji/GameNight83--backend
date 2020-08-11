class CreateFriendshipRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friendship_requests do |t|
      t.integer :user_id
      t.integer :request_id
    end
  end
end
