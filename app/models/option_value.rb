class OptionValue
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes  
  
  field :price, :type => Integer
  field :timestamp, :type => Time
  
  embedded_in :option
end
