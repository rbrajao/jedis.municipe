class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :zipcode
      t.string :street
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :ibge_code
      t.references :municipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
