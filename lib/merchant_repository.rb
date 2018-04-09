# need to finish building the remaining methods from spec
require 'CSV'
# Merchant Repository Class
class MerchantRepository
  attr_reader :contents,
              :parent

  def initialize(path, parent = nil)
    @contents = []
    @parent = parent
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      @contents << Merchant.new(row, self)
    end
  end

  def all
    @contents
  end

  def find_by_id(id)
    @contents.find do |row|
      row.id == id
    end
  end

  def find_by_name(name)
    @contents.find do |row|
      row.name == name
    end
  end

  def find_all_by_name(name)
    @contents.find_all do |row|
      row.name.downcase == name.downcase
    end
  end
