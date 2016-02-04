require 'json'
require 'spec_helper'
require_relative '../customer_extractor.rb'

customer_json = File.open "test_customers.json"
json_customer = File.open "test_customer_list.json"
test_customer = File.open "customer_testing.json"

RSpec.describe "CustomerExtractor" do


  it "should output all customers' information" do
    list_of_customers = CustomerExtractor.new(customer_json)
    expect(list_of_customers.all_customers[1].name).to eq("Alice Cahill")
    expect(list_of_customers.all_customers[1].lat).to eq("51.92893")
    expect(list_of_customers.all_customers[1].lng).to eq("-10.27699")
    expect(list_of_customers.all_customers[1].user_id).to eq(1)
  end

  it "should take a JSON file of customer information and import customer information" do
    customer_list = CustomerExtractor.new(json_customer)

    expect(customer_list.raw_customers.class).to eq(Array)
    expect(customer_list.raw_customers.first.class).to eq(Hash)
    expect(customer_list.raw_customers.first["latitude"]).to eq("53.4692815")
    expect(customer_list.raw_customers.first["longitude"]).to eq("-9.436036")
    expect(customer_list.raw_customers.first["user_id"]).to eq(7)
    expect(customer_list.raw_customers.first["name"]).to eq("Frank Kehoe")

  end

  it "should output a list of nearby customers ordered by user_id, ascending" do
    list = CustomerExtractor.new(test_customer)

    expect(list.close_customers.keys[0]).to be < list.close_customers.keys[1]
    expect(list.close_customers.keys[-1]).to be > list.close_customers.keys[-2]
    expect(list.close_customers.values[0][1]).to be < 100
    expect(list.close_customers.values[-1][1]).to be < 100
    expect(list.close_customers.values[1][1]).to be < 100
  end

end
