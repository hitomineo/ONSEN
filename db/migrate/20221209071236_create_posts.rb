class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer:customer_id ,null:false
      t.integer:onsen_name ,null:false
      t.string :address,null:false
      t.float:latitude,null:false
      t.float:longitude,null:false
      t.integer:parking,default:0,null:false
      t.integer:payment ,default:0,null:false
      t.string:toiletry ,null:false
      t.integer:towel_stock , default:0,null:false
      t.string:skin_product,null:false
      t.string:hairdryer,null:false
      t.string:luggage,null:false
      t.timestamps
    end
  end
end
