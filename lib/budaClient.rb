require "budaClient/version"
require "http"

module BudaClient
  @api_version = "v2"
  @api_fortmat = "json"
  @base_url = "https://www.buda.com/api"

  def self.format_url(url, extra_args = {})
    url % { base_url: @base_url, api: @api_version, format: @api_fortmat }.merge(extra_args)
  end
  class Error < StandardError; end
  class Public
    @markets_url = "%<base_url>s/%<api>s/markets.%<format>s"
    @volume_url = "%<base_url>s/%<api>s/markets/%<market_id>s/volume.%<format>s"
    @ticker_url = "%<base_url>s/%<api>s/markets/%<market_id>s/ticker.%<format>s"
    @order_book_url = "%<base_url>s/%<api>s/markets/%<market_id>s/order_book.%<format>s"
    @trades_url = "%<base_url>s/%<api>s/markets/%<market_id>s/trades.%<format>s"
    @quotations_url = "%<base_url>s/%<api>s/markets/%<market_id>s/quotations.%<format>s"
    @currency_fees_url = \
      "%<base_url>s/%<api>s/currencies/%<currency>s/fees/%<transaction_type>s.%<format>s"

    private_class_method def self.get(url, url_params = {})
      HTTP.get(BudaClient::format_url(url, url_params)).parse
    end

    private_class_method def self.post(url, url_params, payload)
      HTTP.post(BudaClient::format_url(url, url_params), json: payload).parse
    end

    def self.market
      get(@markets_url)
    end

    def self.volume(market_id)
      get(@volume_url, market_id: market_id)
    end

    def self.ticker(market_id)
      get(@ticker_url, market_id: market_id)
    end

    def self.order_book(market_id)
      get(@order_book_url, market_id: market_id)
    end

    def self.trades(market_id)
      get(@trades_url, market_id: market_id)
    end

    def self.quotations(market_id, type, amount, limit = nil)
      post(
        @quotations_url,
        { market_id: market_id },
        { type: type, amount: amount, limit: limit }.reject { |_, value| value.nil? }
      )
    end

    def self.currency_fees(currency, transaction_type)
      get(@currency_fees_url, currency: currency, transaction_type: transaction_type)
    end
  end
  class Private

  end
end
