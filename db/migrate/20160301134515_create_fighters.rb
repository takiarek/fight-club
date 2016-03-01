class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :fname
      t.string :lname
      t.text :description

      t.timestamps null: false
    end
  end
end
