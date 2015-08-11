class DropTableRoundCateogries < ActiveRecord::Migration
  def change
    remove_foreign_key :round_questions, column: :round_category_id
    drop_table :round_categories

    change_table(:rounds) do |t|
      t.references :category, index: true, foreign_key: true
    end

    change_table(:round_questions) do |t|
      t.references :round, index: true, foreign_key: true
    end
  end
end
