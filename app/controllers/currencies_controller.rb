class CurrenciesController < ApplicationController
    def index 

    end

    def search 
        # Returning/sending back JSON of all the cryptocurrencies that relate to that users search
        render json: { currencies: @currencies }
    end

    # Takes in the currency id and the amount owned
    # Returns final calculations
    def calculate
        amount = params[:amount]
        render json: {
            currency: @currency,
            current_price: @currency.current_price,
            amount: amount,
            value: currency.calculate_value(amount)
        }
    end

    private

    def currency 
        @currency ||= Currency.find(params[:id])
    end

    def currencies
        # Comparing the lower case names of what people send through searching for a cryptocurrency to the currencies in our database
        @currencies = Currency.where('LOWER(name) LIKE ?', "%#{params[:search].downcase}%")
    end
end