class CreateRepresentanteAthletes < ActiveRecord::Migration
  def change
    create_table :representante_athletes do |t|
      t.string :name
      t.string :sex
      t.integer :age
      t.references :organization

      t.timestamps
    end
    add_index :representante_athletes, :organization_id
  end
end
