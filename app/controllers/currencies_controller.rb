class CurrenciesController < ApplicationController
  def index
    @date = params[:date].blank? ? Date.today : params[:date]
    @rates = Currencies::Index.call(@date).response
  # @rates = {"USDEUR"=>0.89208, "USDBRL"=>3.9697, "USDARS"=>44.689007}
  end
end