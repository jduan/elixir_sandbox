tax_rates = [ NC: 0.075, TX: 0.08  ]

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount:  35.50 ],
  [ id: 125, ship_to: :TX, net_amount:  24.00 ],
  [ id: 126, ship_to: :TX, net_amount:  44.80 ],
  [ id: 127, ship_to: :NC, net_amount:  25.00 ],
  [ id: 128, ship_to: :MA, net_amount:  10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount:  50.00 ],
]

defmodule TaxCalculator do
  def calculate_tax(orders, tax_rates) do
    for order = [{:id, _id}, {:ship_to, ship_to}, {:net_amount, net_amount}] <- orders do
      total_amount = add_tax(ship_to, net_amount, tax_rates)
      Keyword.put_new(order, :total_amount, total_amount)
    end
  end

  defp add_tax(ship_to, net_amount, tax_rates) do
    rate = Keyword.get(tax_rates, ship_to)
    if rate do
      net_amount * (1 + rate)
    else
      net_amount
    end
  end
end

IO.inspect TaxCalculator.calculate_tax(orders, tax_rates)
