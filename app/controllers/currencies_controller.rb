class CurrenciesController < ApplicationController
  def index
    @rates = Currencies::Index.call(params[:date]).response
  end
end