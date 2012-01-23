class Option
  include Mongoid::Document
  field :asset_id, :type => Integer
  field :option_type, :type => Boolean
  field :expiration, :type => Date
  field :strike, :type => Integer
end
