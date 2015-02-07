require 'net/http'

start = Time.now

currencies =
['USD', 'CAD', 'HKD', 'EUR', 'JPY']

currencies.each do |currency|
  p Net::HTTP.get('download.finance.yahoo.com', "/d/quotes.csv?e=.csv&f=sl1d1t1&s=USD#{currency}=X")
end

p "DONE------- #{start - Time.now} sec" #returns 1.922443 sec ~ 2.041589 sec
