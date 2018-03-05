# class Item < ActiveRecord::Base
#   has_many :brands_items # points to join table
#   has_many :brands, through: :brands_items # links
#   # validates :name, format: { with: /[a-zA-Z]/,
#   #   message: "letters only, please" }
# end
