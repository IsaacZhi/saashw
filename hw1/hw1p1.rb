def palindrome?(string)
  if ( string == nil )
    return true
  end

  replaceString = string.gsub(/\W/, '')
  downcaseString = replaceString.downcase
  return downcaseString == downcaseString.reverse
end

#p true ==  palindrome?("A man, a plan, a canal -- Panama")
#p true == palindrome?("Madam, I'm Adam!")
#p false == palindrome?("Abracadabra")
#p true == palindrome?("")
#p true == palindrome?(nil)

def count_words(string)
  if ( string == nil ) 
    return {}
  end
  downcaseString = string.downcase
  resulthash = {}
  downcaseString.gsub(/\w*/) do |s| 
    if s.length > 0 then
      if ( resulthash.key?s )
        resulthash[s] += 1
      else
        resulthash[s] = 1
      end
    end
  end
  return resulthash
end

#hashr1 = {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
#p hashr1
#p hashr1 == count_words("A man, a plan, a canal -- Panama")
#hashr2 = {'doo' => 3, 'bee' => 2}
#p hashr2
#p hashr2 == (count_words "Doo bee doo bee doo")
#p 'before count_words ""'
#hashnil = {}
#p hashnil == (count_words "")
#p "before count_words nil"
#p hashnil == (count_words nil)

