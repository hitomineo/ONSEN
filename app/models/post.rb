class Post < ApplicationRecord

    belongs_to :customer
    has_one_attached :image
    has_many :likes, dependent: :destroy

# 緯度経度
    geocoded_by :address
    after_validation :geocode

# 星機能
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

# 検索機能
  def self.search(search)
    if search
      Post.where(['onsen_name LIKE ? OR address LIKE ?', "%#{search}%","%#{search}%" ])
    else
      Post.all
    end
  end



    enum parking: { existence: 0, not_exist: 1 }
    enum payment: { cash: 0, credit_card: 1, electronic_payment: 2, qr: 3}
    enum towel_stock: { available: 0, no_exist: 1 }


  def liked_by?(customer)
      likes.exists?(customer_id: customer.id)
  end


  validates :onsen_name,:address,:parking,:payment,:toiletry,:towel_stock,:skin_product,:hairdryer,:luggage, presence: true




  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit:[width, height]).processed
  end

end
