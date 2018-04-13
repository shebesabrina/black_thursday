# Merchant
class Merchant
  attr_reader :id,
              :name,
              :parent

  def initialize(merchant, parent = nil)
    @id = merchant[:id].to_i
    @name = merchant[:name]
    @parent = parent
  end
end
