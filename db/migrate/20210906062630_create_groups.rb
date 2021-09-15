class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.text   :explain , null: false
      t.string :name , null: false
      t.timestamps
    end
  end
end
