class AddIndexToLinksShortUrlAndLongUrl < ActiveRecord::Migration
  def change
    add_index :links, :short_url, unique: true
    add_index :links, :long_url
  end
end
