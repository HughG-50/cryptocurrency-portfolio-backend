class Currency < ApplicationRecord
    def calculate_value(amount)
        (current_price.to_f * amount.to_f).round(4)
    end
    
    def current_price
        url = 'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest'
        # Can also use IDs or slugs other than the symbol, for the quotes/latest endpoint
        request = HTTParty.get(url, :query => { :symbol => self.currency_symbol }, :headers => { 'content-type': 'application/json', 'X-CMC_PRO_API_KEY': ENV['CMC_TEST_API_KEY'] })
        response = JSON.parse(request.body)['data'][self.currency_symbol]['quote']['USD']['price']
    end
end
