require 'factory_girl'

Factory.define :asset do |a|
  a.name = "STABLE ASSET"
  a.sign = "SAS"
  a.note = "Test"
  a.strike_max = 100
  a.strike_min = 1
  a.strike_step = 1
end

