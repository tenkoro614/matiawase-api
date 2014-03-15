class AddIconSelectToMatiawases < ActiveRecord::Migration
  def change
    add_column :matiawases, :iconSelect, :integer
  end
end
