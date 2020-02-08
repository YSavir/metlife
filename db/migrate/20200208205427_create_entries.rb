class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user

      t.datetime :posted_at
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
