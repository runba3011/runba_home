class CreateGroupUserRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :group_user_relations do |t|
      t.references :group , null: false , foreign_key: true
      t.references :user , null: false , foreign_key: true
      t.integer    :authority_id  , null: false
      t.timestamps
    end
  end
end
