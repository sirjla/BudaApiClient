require "spec_helper"

describe BudaClient do
  before do
  end
  describe BudaClient::Public do
    it "has a version number" do
      expect(BudaClient::VERSION).not_to be nil
    end

    it "url format works" do
      expect(
        BudaClient::format_url("%<base_url>s/%<api>s.%<format>s")
      ).to eq("https://www.buda.com/api/v2.json")
    end

    it "url format works with extra parameters" do
      expect(
        BudaClient::format_url("%<base_url>s/%<api>s/%<id>s.%<format>s", id: "123")
      ).to eq("https://www.buda.com/api/v2/123.json")
    end

    it "market call works" do
      api_return = parse_json("spec/support/jsons/markets.json")
      allow(BudaClient::Public).to receive(:get).and_return(api_return)
      expect(BudaClient::Public.market).to eq(api_return)
    end

    it "volume call works" do
      api_return = parse_json("spec/support/jsons/volume.json")
      allow(BudaClient::Public).to receive(:get).and_return(api_return)
      expect(BudaClient::Public.volume(market_id: "BTC-CLP")).to eq(api_return)
    end

    it "ticker call works" do
      api_return = parse_json("spec/support/jsons/ticker.json")
      allow(BudaClient::Public).to receive(:get).and_return(api_return)
      expect(BudaClient::Public.ticker(market_id: "BTC-CLP")).to eq(api_return)
    end

    it "order_book call works" do
      api_return = parse_json("spec/support/jsons/order_book.json")
      allow(BudaClient::Public).to receive(:get).and_return(api_return)
      expect(BudaClient::Public.order_book(market_id: "BTC-CLP")).to eq(api_return)
    end

    it "trades call works" do
      api_return = parse_json("spec/support/jsons/trades.json")
      allow(BudaClient::Public).to receive(:get).and_return(api_return)
      expect(BudaClient::Public.trades(market_id: "BTC-CLP")).to eq(api_return)
    end

    it "quotations call works" do
      api_return = parse_json("spec/support/jsons/quotations.json")
      allow(BudaClient::Public).to receive(:post).and_return(api_return)
      expect(BudaClient::Public.quotations("BTC-CLP", "bid_given_size", 1)).to eq(api_return)
    end

    it "currency_fees call works" do
      api_return = parse_json("spec/support/jsons/currency_fees.json")
      allow(BudaClient::Public).to receive(:get).and_return(api_return)
      expect(
        BudaClient::Public.currency_fees("BTC", "withdrawal")
      ).to eq(api_return)
    end
  end

  describe BudaClient::Private do

  end
end
