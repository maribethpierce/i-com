require 'json'
require_relative 'customer.rb'
require_relative 'distance.rb'
require 'pry'

raw_customer_list = File.open "customers.json"

class CustomerExtractor
  attr_reader :customers, :raw_customers, :close_customers

  def initialize(json_file)
    @file = json_file
    @customer_information = read_from_file
  end

  def all_customers
    @customers = []
    self.raw_customers.each do |customer|
      @customers << Customer.new(customer["latitude"], customer["user_id"], customer["name"], customer["longitude"])
    end
    @customers
  end

  def close_customers
    @close_customers = Hash.new
    self.all_customers.each do |c|
      if c.distance < 100
        @close_customers[c.user_id] = [c.name, c.distance]
      end
    end
    @close_customers.sort.to_h
  end


  private

  def read_from_file
    @raw_customers = []
    @file.each do |customer_information|
      @raw_customers << JSON.parse(customer_information)
    end
    @raw_customers
  end
end

list = CustomerExtractor.new(raw_customer_list)
# puts list.close_customers
# binding.pry
