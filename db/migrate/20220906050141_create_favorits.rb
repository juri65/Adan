class CreateFavorits < ActiveRecord::Migration[6.1]
  def change
    create_table :favorits do |t|

      t.timestamps
    end
  end
end
