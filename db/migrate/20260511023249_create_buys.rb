class CreateBuys < ActiveRecord::Migration[7.1]
  def change
    create_table :buys do |t|

      t.timestamps
    end
  end
end
