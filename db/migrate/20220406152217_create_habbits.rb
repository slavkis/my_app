class CreateHabbits < ActiveRecord::Migration[7.0]
  def change
    create_table :habbits do |t|
      t.string :name
      t.references :user, nul: false, foreign_key: true
      t.timestamps
    end
  end
end
