class Store < ActiveRecord::Base
  before_save(:fix)  
  has_many :brands_stores # points to join table
  has_many :brands, through: :brands_stores # links
  validates(:name, {:uniqueness => true, :presence => true, :length => { :maximum => 100 }})


    private

      def fix
        self.name=self.name.capitalize
      end

    end
