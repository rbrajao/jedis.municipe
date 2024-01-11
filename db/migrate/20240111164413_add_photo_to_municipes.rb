class AddPhotoToMunicipes < ActiveRecord::Migration[7.1]
  def change
    add_column :municipes, :photo, :string
  end
end
