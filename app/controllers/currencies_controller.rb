class CurrenciesController < ApplicationController
  def index
    rates = Currencies::Index.call.response

    @series = []
    rates['rates'].each do |rate|
      @series << { name: rate[0], data: rate[1].map{|k,v| "#{v}".to_f} }
    end
  end
end