class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  after_create :invalidate_cache
  after_update :invalidate_cache
  after_destroy :invalidate_cache

  def invalidate_cache
    Rails.cache.clear
  end
end
