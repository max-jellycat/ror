class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    change_table :posts do |t|
      t.timestamps
    end
  end
end
