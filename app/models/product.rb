class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :category_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :price, comparison: {greater_than: 0}
  validates :description, length: {in: 10..500}


  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    if price <= 10
      true
    else
      false
    end
  end
  
  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end
