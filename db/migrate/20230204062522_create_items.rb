class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.integer :price, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_cost_on_id, null: false
      t.integer :origin_id, null: false
      t.integer :lead_time_id, null: false

      t.timestamps
    end
  end
end
