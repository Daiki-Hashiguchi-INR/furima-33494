class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,               null: false
      t.text       :explain,            null: false
      t.integer    :category_id,        null:false
      t.integer    :condition_id,       null:false
      t.integer    :post_type_id,       null:false
      t.integer    :prefecture_id,      null:false
      t.integer    :preparation_day_id, null:false
      t.integer    :price,              null:false
      t.references :user,               foreign_key: true
      t.timestamps
    end
  end
end
