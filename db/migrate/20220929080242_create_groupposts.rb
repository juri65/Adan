class CreateGroupposts < ActiveRecord::Migration[6.1]
  def change
    create_table :groupposts do |t|

      t.timestamps
    end
  end
end
