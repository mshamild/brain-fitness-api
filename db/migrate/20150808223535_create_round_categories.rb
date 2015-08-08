class CreateRoundCategories < ActiveRecord::Migration
  def change
    create_table :round_categories do |t|
      t.references :round, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
