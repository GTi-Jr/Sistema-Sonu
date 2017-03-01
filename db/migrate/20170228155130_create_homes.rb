class CreateHomes < ActiveRecord::Migration[5.0]
  def change
   drop_table :homes
   create_table :homes do |t|
      t.string :name

      t.timestamps
    end
  end
end
