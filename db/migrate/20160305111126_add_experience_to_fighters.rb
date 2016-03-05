class AddExperienceToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :experience, :float, default: 0
  end
end
