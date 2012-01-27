class VolValue
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :value, :type => Integer
  field :timestamp, :type => Date

  embedded_in :volatility

  validates_presence_of :value, :timestamp
  validates_uniqueness_of :timestamp
validates_numericality_of :value, :presence => true

  before_create :update_value

  private

  def update_value
    self.value *= 100
  end

end

