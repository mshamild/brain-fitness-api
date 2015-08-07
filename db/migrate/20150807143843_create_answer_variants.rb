class CreateAnswerVariants < ActiveRecord::Migration
  def change
    create_table :answer_variants do |t|
      t.references :question, index: true, foreign_key: true
      t.string :text
      t.boolean :value

      t.timestamps null: false
    end
  end
end
