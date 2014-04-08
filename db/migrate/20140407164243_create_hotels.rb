class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :inncode
      t.string :name

      t.timestamps
    end
  end
end
