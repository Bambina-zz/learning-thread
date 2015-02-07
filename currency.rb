require 'net/http'

start = Time.now

currencies =
['USD', 'CAD', 'HKD', 'EUR', 'JPY', 'AUD', 'CNY', 'DEM', 'GBP', 'ILS', 'INR', 'XAU']

threads = []

currencies.each do |currency|
  threads << Thread.new do
    p Net::HTTP.get('download.finance.yahoo.com', "/d/quotes.csv?e=.csv&f=sl1d1t1&s=USD#{currency}=X")
  end
end

# conbines all threads to main thread
threads.each do |t|
  t.join
end

p "DONE------- #{Time.now - start} sec" #returns 0.416909 sec ~ 0.424654 sec
