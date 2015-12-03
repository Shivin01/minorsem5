class CreateCs < ActiveRecord::Migration
  def change
    create_table :cs do |t|
      t.text :content
      t.references :pin, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
