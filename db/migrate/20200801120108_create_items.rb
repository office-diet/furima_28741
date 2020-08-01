class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,            null: false
      t.text        :text,            null: false
      t.integer     :price,           null: false
      t.bigint      :user_id,         null: false, foreign_key: true
      t.references  :category,        null: false, foreign_key: true
      t.references  :condition,       null: false, foreign_key: true
      t.references  :postage,         null: false, foreign_key: true
      t.references  :prefcture,       null: false, foreign_key: true
      t.references  :shipment_delay,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
