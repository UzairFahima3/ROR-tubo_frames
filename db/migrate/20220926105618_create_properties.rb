class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :street
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
