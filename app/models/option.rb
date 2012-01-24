class Option
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :option_type, :type => Boolean
  field :expiration, :type => Date
  field :strike, :type => Integer
  
  embedded_in :asset
  embeds_many :option_values
  
  def is_call?
    option_type == true  
  end
  
  def to_s
    "#{is_call? ? 'C':'P'}#{self.strike} #{(self.expiration.to_s(:expiration)).gsub(' ', '')}" 
  end
end
