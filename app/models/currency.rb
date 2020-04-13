class Currency < ApplicationRecord
    def current_price
        # url = 'https://api.coinmarketcap.com/v1/ticker/' - API is no longer running - see learning APIs code - use API sandbox
        # slugs correspond to the endpoint on the coinmarketcap API so we can get data on each cryptocurrency
        request = HTTParty.get(url + self.slug)
        response = JSON.parse(request.body)
    end
end
