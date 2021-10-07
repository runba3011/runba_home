class CreateAllUserRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :all_user_requests do |t|
      t.string :text , null: false
      t.string :is_open_name , null: false
      t.references :user , null: false , foreign_key: true
      t.timestamps
    end
  end
end
