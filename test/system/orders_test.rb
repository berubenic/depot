require 'application_system_test_case'

class OrdersTest < ApplicationSystemTestCase
    setup do
        @order = orders(:one)
    end

    test 'visiting the index' do
        visit orders_url
        assert_selector 'h1', text: 'Orders'
    end

    test 'destroying a Order' do
        visit orders_url
        page.accept_confirm do
            click_on 'Destroy', match: :first
        end

        assert_text 'Order was successfully destroyed'
    end

    test 'check routing number' do
        visit store_index_url

        click_on 'Add to Cart', match: :first

        click_on 'Checkout'

        fill_in 'order_name', with: 'Dave Thomas'
        fill_in 'order_address', with: '123 Main Street'
        fill_in 'order_email', with: 'dave@example.com'

        assert_no_selector '#order_routing_number'
        assert_no_selector '#order_account_number'

        select 'Check', from: 'Pay type'

        assert_selector '#order_routing_number'
        assert_selector '#order_account_number'
    end

    test 'check credit card number' do
        visit store_index_url

        click_on 'Add to Cart', match: :first

        click_on 'Checkout'

        fill_in 'order_name', with: 'Dave Thomas'
        fill_in 'order_address', with: '123 Main Street'
        fill_in 'order_email', with: 'dave@example.com'

        assert_no_selector '#order_credit_card_number'
        assert_no_selector '#order_expiration_date'

        select 'Credit card', from: 'Pay type'

        assert_selector '#order_credit_card_number'
        assert_selector '#order_expiration_date'
    end

    test 'Cart is not displayed when empty' do
        visit store_index_url

        assert_selector '.carts', visible: false
    end

    test 'Cart is displayed after adding a product' do
        visit store_index_url

        click_on 'Add to Cart', match: :first

        assert_selector '.carts'
    end

    test 'Item in cart is highlighted after adding to cart' do
        visit store_index_url

        click_on 'Add to Cart', match: :first

        assert_selector '.line-item-highlight'
    end
end
