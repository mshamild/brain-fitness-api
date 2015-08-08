class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
