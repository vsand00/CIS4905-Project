class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.text :location
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
