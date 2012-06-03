class CartesianProduct
  include Enumerable

  def initialize(arrayA, arrayB)
    if ( arrayA.class != Array || arrayB.class != Array )
      @arrayCP = []
    elsif ( arrayA.length == 0 || arrayB.length == 0 )
      @arrayCP = []
    else
      @arrayCP = arrayA.product(arrayB)
    end
    return @arrayCP

  end

  def each
    @arrayCP.each { |x| yield x }
  end
end

=begin
#Examples of use
c = CartesianProduct.new([:a, :b], [4, 5])
p c
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a, :b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
=end

