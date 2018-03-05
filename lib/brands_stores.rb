class BrandsStore < ActiveRecord::Base
  belongs_to :store # singular, single instance
  belongs_to :brand # singular, single instance
end
