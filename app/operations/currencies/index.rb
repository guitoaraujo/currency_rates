class Currencies::Index

  attr_accessor :response

  def self.call(date)
    this = new(date)
    this.call
    this
  end

  def initialize(date)
    @date       = date.blank? ? Date.today : date
    @key        = '4681edf90fa1de308c0571241e4682e3'
    @url        = 'http://apilayer.net/api/historical'
    @currencies = 'EUR, BRL, ARS'
  end

  def call
    format_currencies
  end

  private

  def format_currencies
    @response = HTTParty.get("#{@url}?currencies=#{@currencies}&access_key=#{@key}&date=#{@date}")['quotes']
  end

end