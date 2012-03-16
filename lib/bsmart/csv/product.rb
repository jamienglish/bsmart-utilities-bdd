module Bsmart::CSV
  class Product
    include ROXML
    include Comma

    xml_accessor :name,      from: 'Description' do |name| name.strip end
    xml_accessor :sku,       from: 'StockNum'
    xml_accessor :reference, from: 'Reference' do |ref| ref.strip end
    xml_accessor :qty,  from: 'CurrStk' do |qty| qty.to_i.to_s end
    
    comma do
      name
      sku
      reference
      qty
    end
  end
end