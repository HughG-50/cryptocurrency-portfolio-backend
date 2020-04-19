class Currency < ApplicationRecord
    def current_price
        # Old API format
        # url = 'https://api.coinmarketcap.com/v1/ticker/' - API is no longer running - use API sandbox to begin with
        # slugs correspond to the endpoint on the coinmarketcap API so we can get data on each cryptocurrency
        # request = HTTParty.get(url + self.slug)
        # response = JSON.parse(request.body)

        url = 'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest'
        # Need to figure out how to set and retrieve ENV variable for API KEY
        #request = HTTParty.get(url, :query => { :slug => self.slug }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': ENV['CMC_TEST_API_KEY'] })
        request = HTTParty.get(url, :query => { :symbol => self.currency_symbol }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': ENV['CMC_TEST_API_KEY'] })
        response = JSON.parse(request.body)['data'][self.currency_symbol]['quote']['USD']['price']
    end
end
