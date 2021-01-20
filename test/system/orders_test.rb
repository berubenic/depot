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
end
