class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :following , null: false , foreign_key: { to_table: :users }
      t.references :user , null: false , foreign_key: true
      t.timestamps
    end
  end
end
