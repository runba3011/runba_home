class CreateGroupUserRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :group_user_relations do |t|

      t.timestamps
    end
  end
end
