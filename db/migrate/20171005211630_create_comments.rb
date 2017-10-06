class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.text :body, null: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
