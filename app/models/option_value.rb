class OptionValue
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes  
  
  field :price, :type => Integer
  field :timestamp, :type => DateTime
  
  embedded_in :option
  validates :timestamp, :presence => true, :uniqueness => true
  validates :price, :presence => true
  
  before_create :change_price
  
  private
  
  def change_price
    self.price *= 100  
  end
  
end
