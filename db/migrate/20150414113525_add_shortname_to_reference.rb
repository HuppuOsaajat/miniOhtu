class AddShortnameToReference < ActiveRecord::Migration
  def change
    add_column :references, :shortname, :string
  end
end
