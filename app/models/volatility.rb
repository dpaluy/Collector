class Volatility
  include Mongoid::Document
  field :name
  field :note
  
  embeds_many :vol_values
  validates :name, :presence => true, :uniqueness => true
  
end
