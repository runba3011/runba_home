class CreateStickmanWarComments < ActiveRecord::Migration[6.0]
  def change
    create_table :stickman_war_comments do |t|
      t.string :stage_type , null: false
      t.string :stage_id , null: false
      t.string :text , null: false
      t.references :user ,null: false , foreign_key: true
      t.timestamps
    end
  end
end
