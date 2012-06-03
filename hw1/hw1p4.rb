class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  attr_accessor :name, :calories

  def healthy?
    if ( @calories == nil )
      return true
    end

    if ( @calories.class == String )
      tempCal = @calories.to_i
    else
      tempCal = @calories
    end

    return ( tempCal < 200 )
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  attr_accessor :flavor

  def delicious?
    if ( @flavor.class != String )
      return true
    end

    if ( @flavor == nil )
      return true
    end

    if ( @flavor.downcase == "black licorice" )
      return false
    else
      return true
    end
  end
end

=begin
test1 = Dessert.new(nil, nil)
p test1.name
p test1.calories
p test1.healthy?
p test1.delicious?
test2 = Dessert.new("Cake", 100)
p test2.name
p test2.calories
p test2.healthy?
p test2.delicious?
test3 = Dessert.new("coke", 200)
p test3.name
p test3.calories
p test3.healthy?
p test3.delicious?
test4 = JellyBean.new("Licorice", 150, "Black licorice")
p test4.name
p test4.calories
p test4.flavor
p test4.healthy?
p test4.delicious?
=end

