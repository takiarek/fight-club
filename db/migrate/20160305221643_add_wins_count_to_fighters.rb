class AddWinsCountToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :wins_count, :integer
  end
end
