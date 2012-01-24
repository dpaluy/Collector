class Value
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
    
  field :price, :type => Integer
  field :timestamp, :type => DateTime
  
  embedded_in :asset
end
