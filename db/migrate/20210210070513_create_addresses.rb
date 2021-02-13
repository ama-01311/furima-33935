class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :delivery_post_number,   null: false
      t.integer    :delivery_prefecture_id, null: false
      t.string     :delivery_municipality,  null: false
      t.string     :delivery_address,       null: false
      t.string     :delivery_building
      t.string     :phone_number,           null: false
      t.references :order,                  foreign_key: true
      t.timestamps
    end
  end
end
