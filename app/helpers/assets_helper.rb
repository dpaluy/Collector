module AssetsHelper

  def strike_range(asset)
    "#{asset.strike_min}..#{asset.strike_max} (#{asset.strike_step})"
  end
end
