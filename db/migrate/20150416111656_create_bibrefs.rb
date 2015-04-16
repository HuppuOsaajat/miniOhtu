class CreateBibrefs < ActiveRecord::Migration
  def change
    create_table :bibrefs do |t|
      t.string :shortname

      t.timestamps null: false
    end
  end
end
