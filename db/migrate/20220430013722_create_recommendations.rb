class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.references :user, null: false
      t.references :source, foreign_key: { to_table: :books }, null: false
      t.references :result, foreign_key: { to_table: :books }
      t.jsonb :metadata

      t.timestamps
    end
  end
end
 