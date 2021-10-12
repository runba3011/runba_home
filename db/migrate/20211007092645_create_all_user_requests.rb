class CreateAllUserRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :all_user_requests do |t|
      t.references :request_creater , null: false , foreign_key: {to_table: :users}
      t.references :user , null: false , foreign_key: true
      t.text :text , null: false , limit: 429496
      t.string :is_open_name , null: false
      t.integer :status
      t.timestamps
    end
  end
end
