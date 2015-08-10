class CreateRoundQuestions < ActiveRecord::Migration
  def change
    create_table :round_questions do |t|
      t.references :round_category, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
