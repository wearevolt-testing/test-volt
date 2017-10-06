class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :author, polymorphic: true
      t.datetime :published_at

      t.timestamps
    end
  end
end
