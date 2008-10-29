class ChangeVoteColumn < ActiveRecord::Migration
  def self.up
    change_column :candidates, :votes, :integer, :default => 0
  end

  def self.down
    
  end
end
