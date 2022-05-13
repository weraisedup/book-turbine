 class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.date :release_date
      t.bigint :isbn
      t.string :subjects, array: true, default: []
      t.jsonb :metadata

      t.timestamps
    end
  end
end
