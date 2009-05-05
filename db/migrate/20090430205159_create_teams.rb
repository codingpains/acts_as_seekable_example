class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :level
      t.integer :championships

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
