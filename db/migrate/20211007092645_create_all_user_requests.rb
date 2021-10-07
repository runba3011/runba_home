class CreateAllUserRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :all_user_requests do |t|

      t.timestamps
    end
  end
end
