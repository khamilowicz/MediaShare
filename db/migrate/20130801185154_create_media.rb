class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
