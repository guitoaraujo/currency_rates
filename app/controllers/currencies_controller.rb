class CurrenciesController < ApplicationController
  def index
    # @rates = Currencies::Index.call(params[:date]).response
  @rates = {"USDEUR"=>0.89208, "USDBRL"=>3.9697, "USDARS"=>44.689007}
  end
end