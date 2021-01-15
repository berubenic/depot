module ViewCount
    private

    def set_view_count
        @view_count = Store.find(session[:])
     end
end
