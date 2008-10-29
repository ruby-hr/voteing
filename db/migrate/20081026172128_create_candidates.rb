class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.integer :votes

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
