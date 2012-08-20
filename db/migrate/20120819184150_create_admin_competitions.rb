class CreateAdminCompetitions < ActiveRecord::Migration
  def change
    create_table :admin_competitions do |t|
      t.string :name
      t.string :sex
      t.integer :max_age
      t.integer :min_age
      t.integer :max_per_org

      t.timestamps
    end
  end
end
