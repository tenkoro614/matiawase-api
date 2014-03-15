class CreateMatiawases < ActiveRecord::Migration
  def change
    create_table :matiawases do |t|
      t.string :groupname
      t.string :devid
      t.string :username
      t.integer :iconSelect
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
