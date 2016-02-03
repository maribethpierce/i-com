require 'json'
require 'spec_helper'
require_relative '../customer_extractor.rb'

customer_json = File.open "test_customers.json"
json_customer = 
RSpec.describe "CustomerExtractor" do


  it "should output all customers' information" do
    list_of_customers = CustomerExtractor.new(customer_json)
    expect(list_of_customers.all_customers[1].name).to eq("Alice Cahill")
    expect(list_of_customers.all_customers[1].lat).to eq("51.92893")
    expect(list_of_customers.all_customers[1].lng).to eq("-10.27699")
    expect(list_of_customers.all_customers[1].user_id).to eq(1)
  end

  it "should take a JSON file of customer information and import customer information" do
    customer_list = CustomerExtractor.new(customer_json)

    expect(customer_list.raw_customers.class).to eq(Array)
    expect(customer_list.raw_customers.first.class).to eq(Hash)
    expect(customer_list.raw_customers.first["latitude"]).to eq("52.986375")
    expect(customer_list.raw_customers.first["longitude"]).to eq("-6.043701")
    expect(customer_list.raw_customers.first["user_id"]).to eq(12)
    expect(customer_list.raw_customers.first["name"]).to eq("Christina McArdle")

  end
end
