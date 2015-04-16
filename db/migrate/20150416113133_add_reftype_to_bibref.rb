class AddReftypeToBibref < ActiveRecord::Migration
  def change

    add_column :bibrefs, :reftype, :string
  end
end
