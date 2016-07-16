class Product < ApplicationRecord
	has_many :line_items
	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
end
