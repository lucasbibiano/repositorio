class CreateAthletesCompetitionsTable < ActiveRecord::Migration
  def up
  	create_table :athletes_competitions, :id => false do |t|
        t.references :athlete
        t.references :competition
    end
    add_index :athletes_competitions, [:athlete_id, :competition_id]
    add_index :athletes_competitions, [:competition_id, :athlete_id]
  end

  def down
  	drop_table :athletes_competitions
  end
end
