class CreateAdminOrganizations < ActiveRecord::Migration
  def change
    create_table :admin_organizations do |t|
      t.string :name

      t.timestamps
    end
  end
end
