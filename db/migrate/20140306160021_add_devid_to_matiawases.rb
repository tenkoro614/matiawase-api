class AddDevidToMatiawases < ActiveRecord::Migration
  def change
    add_column :matiawases, :devid, :string
  end
end
