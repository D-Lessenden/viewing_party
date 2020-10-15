class AddPartiesToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :party, foreign_key: true
  end
end
