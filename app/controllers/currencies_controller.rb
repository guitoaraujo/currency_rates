class CurrenciesController < ApplicationController
  def index
    @filters = {
      base:   params[:base]   || 'BRL',
      target: params[:target] || 'USD'
    }
    rates = Currencies::Index.call(@filters).response
    set_data(rates['rates'])
  end

  private

  def set_data(rates)
    @series     = []
    @categories = []
    rates.each do |rate|
      @series     << rate[1].map{|k,v| "#{v}".to_f }
      @categories << rate[0]
    end
  end
end