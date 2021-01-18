xml.order_list(for_product: @product.title) do
    @product.orders.each do |o|
        xml.order do
            xml.name(o.name)
            xml.email(o.email)
        end
    end
end
