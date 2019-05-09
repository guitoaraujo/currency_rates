class Currencies::Index
  attr_accessor :response

  def self.call(filters)
    this = new(filters)
    this.call
    this
  end

  def initialize(filters)
    @base       = filters[:base]
    @symbols    = filters[:target]
    @key        = '4681edf90fa1de308c0571241e4682e3'
    @url        = 'https://api.exchangeratesapi.io/history'
    @start_at   = 1.week.ago.strftime('%Y-%m-%d')
    @end_at     = Date.today.strftime('%Y-%m-%d')
  end

  def call
    format_currencies
  end

  private

  def format_currencies
    @response = HTTParty.get("#{@url}?base=#{@base}&start_at=#{@start_at}&end_at=#{@end_at}&symbols=#{@symbols}")
  end

end