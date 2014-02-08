class AddVisitsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visits, :integer, :null => false, :default => 0
  end
end
