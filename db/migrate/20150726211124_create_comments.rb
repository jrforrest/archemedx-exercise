class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :parent, required: true, polymorphic: true
      t.references :author, as: :author, required: true

      t.text :body, required: true

      t.timestamps null: false
    end
  end
end
