class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :short_url
      t.string :long_url
      t.integer :user_id

      t.timestamps
    end
  end
end
