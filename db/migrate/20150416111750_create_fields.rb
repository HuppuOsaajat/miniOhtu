class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :bibref_id
      t.string :name
      t.string :content

      t.timestamps null: false
    end
  end
end
