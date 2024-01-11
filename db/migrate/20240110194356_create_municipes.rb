class CreateMunicipes < ActiveRecord::Migration[7.1]
  def change
    create_table :municipes do |t|
      t.string :name
      t.string :cpf
      t.string :cns
      t.string :email
      t.string :country_code
      t.string :mobile
      t.date :birthday
      t.boolean :status

      t.timestamps
    end
  end
end
