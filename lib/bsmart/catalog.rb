module Bsmart
  class Catalog
    include ROXML

    xml_accessor :suppliers, :as => [Supplier]

    def products
      suppliers.inject([]) do |products, supplier|
        products += supplier.products
      end
    end

    def find_by_reference(reference)
      products.select {|product| product.reference == reference }
    end

    def duplicate_products
      duplicate_references.inject([]) {|dupes, ref| dupes += find_by_reference(ref) }
    end

    def duplicate_references
      counted_products.select {|product, count| count > 1 }.keys
    end

    def counted_products
      products.inject(Hash.new(0)) { |hsh, prod| hsh[prod.reference] += 1; hsh }
    end
  end
end
