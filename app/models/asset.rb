class Asset
  include Mongoid::Document
  
  field :name
  field :sign
  field :note
  
  validates :name, :presence => true, :uniqueness => true
  index :sign, unique: true
end
