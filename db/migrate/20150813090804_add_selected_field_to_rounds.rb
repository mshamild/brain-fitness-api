class AddSelectedFieldToRounds < ActiveRecord::Migration
  def change
    add_column :round_categories, :selected, :boolean, default: false
  end
end
