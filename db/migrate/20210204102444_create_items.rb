class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,              null: false
      t.text       :item_description,       null: false
      t.integer    :item_category_id,       null: false
      t.integer    :item_state_id,          null: false
      t.integer    :delivery_side_id,       null: false
      t.integer    :delivery_prefecture_id, null: false
      t.integer    :delivery_days_id,       null: false
      t.integer    :selling_price,          null: false
      t.references :user,                   foreign_key: true
      t.timestamps
    end
  end
end
