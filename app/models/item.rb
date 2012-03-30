class Item < ActiveRecord::Base
belongs_to :product
belongs_to :freezer

 def save
    self.price = (product.price * weight);#calculates the price of the item based on the price per pound and the weight
    super   # calls the rails save function to store our object to the database
  end
end
