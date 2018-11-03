class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.text :title
      t.string :source
      t.string :url

      t.timestamps
    end
  end
end
