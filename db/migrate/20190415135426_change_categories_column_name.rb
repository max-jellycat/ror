class ChangeCategoriesColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :name, :title
  end
end
