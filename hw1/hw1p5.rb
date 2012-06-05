class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # make sure it's a string
    attr_reader attr_name       # create the attribute's getter
    attr_reader attr_name+"_history"  # create bar_history getter
    class_eval "def #{attr_name + '='}(value) 
            #{'@'+attr_name} = value
            if ( #{'@'+ attr_name+'_history'} == nil)
                #{'@'+attr_name+'_history'} = [nil]; end
            #{'@' + attr_name + '_history'} <<= value; end"
  end
end
=begin
class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 3
f.bar = :wowzo
f.bar = 'boo!'
p f.bar_history

f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f. bar = 4
p f.bar_history

f = Foo.new
p f.bar_history

class TwoClass
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

t = TwoClass.new
p t.bar_history
p t.foo_history
t.bar = :test
t.foo = "test"
t.foo = 23
t.bar = 43
p t.bar_history
p t.foo_history
=end

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    elsif method_id == :in
      if (args.size == 1)
        in_currency = args[0].to_s.gsub( /s$/, '')
        if @@currencies.has_key?(in_currency)
          self / @@currencies[in_currency]
        end
      end
    else
      super
    end
  end
end
=begin
p 5.dollars
p 10.euros
p 5.dollars.in(:euros)
p 10.euros.in(:rupees)
p 1.dollar.in(:rupees)
p 10.rupees.in(:euro)
=end

class String;  def method_missing(method_id)
    if (method_id == :palindrome?) 
      str=self.gsub(/\W/,''); ds = str.downcase; return (ds == ds.reverse)
    else super; end end  end

=begin
p true == "A man, a plan, a canal -- Panama".palindrome?
p true == "Madam, I'm Adam!".palindrome?
p false == "Abracadabra".palindrome?
p true == "".palindrome?
=end

module Enumerable; def method_missing(method_id)
  if (method_id == :palindrome?)
    self.to_a == self.to_a.reverse
  else super; end end end

=begin
p [1, 2, 3, 2, 1].palindrome?
p [].palindrome?
p [1].palindrome?
p [231, 1, 23].palindrome?
=end

