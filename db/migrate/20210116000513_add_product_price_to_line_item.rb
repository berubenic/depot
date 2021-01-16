class AddProductPriceToLineItem < ActiveRecord::Migration[6.1]
    def change
        add_column :line_items, :price, :decimal, precision: 8, scale: 2
        # update 'UPDATE line_items SET price = (SELECT products.price FROM products WHERE line_items.product_id = products.id)'
        LineItem.update_all('price = (SELECT products.price FROM products WHERE line_items.product_id = products.id)')
    end
end
# UPDATE lineItems SET lineItems.price = product.price
# FROM lineItems product
# INNER JOIN lineItems.price product.price
# ON lineItems.product = product.id
