class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer:customer_id ,null:false
      t.string:onsen_name ,null:false
      t.string:detail
      t.string :address
      t.float:latitude
      t.float:longitude
      t.integer:parking, default:0,null:false
      t.integer:payment, default:0,null:false
      t.string:toiletry, null:false
      t.integer:towel_stock , default:0,null:false
      t.string:skin_product, null:false
      t.string:hairdryer, null:false
      t.string:luggage, null:false
      t.string:star
      t.timestamps
    end
  end
end
