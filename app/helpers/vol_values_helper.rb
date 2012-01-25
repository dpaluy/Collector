module VolValuesHelper

  def real_value(val)
    result = val.to_f / 100
    number_with_delimiter(result)
  end
end
