class AddDetailsToMatiawases < ActiveRecord::Migration
  def change
    add_column :matiawases, :deviceToken, :string
  end
end
