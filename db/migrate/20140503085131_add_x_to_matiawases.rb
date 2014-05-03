class AddXToMatiawases < ActiveRecord::Migration
  def change
    add_column :matiawases, :gpsAccuracy, :integer
  end
end
