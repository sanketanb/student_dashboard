class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :branch
      t.string :street
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
