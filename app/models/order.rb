class Order < ActiveRecord::Base
  belongs_to :user
  before_validation :set_total!
  
  validtes :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  validates :user_id, presence: true
  
  has_many :placements
  has_many :products, through: :placements
  
  def set_total!
    self.total = products.map(&:price).sum
  end
end
