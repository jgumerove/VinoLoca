class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.string :title
      t.string :category
      t.integer :year
      t.integer :rating
      t.integer :price
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
