class Asset
  include Mongoid::Document
  
  field :name
  field :sign
  field :note
  field :strike_min, :type => Integer, :default => 1
  field :strike_max, :type => Integer, :default => 100
  field :strike_step, :type => Integer, :default => 1
  field :currency, :default => Money.default_currency.to_s
  
  validates :name, :presence => true, :uniqueness => true
  validates :sign, :presence => true, :uniqueness => true
  validates :strike_min, :strike_max, :strike_step, :presence => true
  validates_numericality_of :strike_min, :greater_than => 0
  validates_numericality_of :strike_max, :greater_than => 0
  validates_numericality_of :strike_step,:greater_than => 0
      
  index :sign, unique: true
  key :sign
  
  embeds_many :options
end
