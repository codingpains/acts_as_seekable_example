class CreateSoccerPlayers < ActiveRecord::Migration
  def self.up
    create_table :soccer_players do |t|
      t.string :name
      t.integer :age
      t.boolean :active
      t.string :level
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :soccer_players
  end
end
