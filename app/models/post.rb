class Post < ApplicationRecord

    belongs_to :customer
    has_one_attached :image

    geocoded_by :address
    after_validation :geocode

    enum parking: { existence: 0, not_exist: 1 }
    enum payment: { cash: 0, credit_card: 1, electronic_payment: 2, qr: 3}
    enum towel_stock: { available: 0, no_exist: 1 }


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit:[width, height]).processed
  end





end
