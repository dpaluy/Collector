module ValuesHelper
  
  def pretty_money(money, precision = 2)
    unless money.nil?
      number_to_currency(money.to_f, :unit => money.symbol, :delimiter => ",", 
              :separator => ".", :precision => precision)
    end
  end
end
