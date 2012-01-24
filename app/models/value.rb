class Value
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
    
  field :price, :type => Integer
  field :timestamp, :type => DateTime
  
  embedded_in :asset
  
  validates :timestamp, :uniqueness => true
  
  before_create :change_price
  
  private
  
  def change_price
    self.price *= 100  
  end

end
