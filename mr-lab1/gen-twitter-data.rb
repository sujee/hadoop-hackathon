#!/usr/bin/env ruby


## generates mock twitter data
# log format
# timestamp (in ms), user, tweet

## multi threaded version... ruby doesn't have native threads, so threading has no effect
## execute with jruby to see true threading
## jruby log-gen.rb

# config
days=5
entries=100
# end config

time_inc = (24.0*3600)/entries
#puts "time inc : #{time_inc}"



words = %w[watching listening reading I am just started working enjoying debating finished]
hashtags = %w[#facebook #yahoo  #obama #romney  #olympics  #hadoop  #hbase #latte]

threads = []

0.upto(days-1) do |day|

  threads << Thread.new(day) do |myday|
    start_ts = Time.local(2012, 1, 1) + myday * 24 * 3600
    end_ts = Time.local(2012, 1, 1 , 23, 59, 59) + myday * 24 * 3600
    filename = start_ts.strftime("%Y-%m-%d") + ".log"
    puts "writing #{filename}"
    last_ts = start_ts
    File.open(filename, 'w') do |f|
      while last_ts < end_ts
        last_ts =  last_ts + time_inc

        timestamp = (last_ts.to_f*1000).to_i

        a = rand(words.size)
        b = a + rand(words.size - a)
        b = words.size - 1 if b > words.size - 1

        hash = hashtags[rand(hashtags.size)]

        sent = words[a..b] << hash << words[b]

        #second hash
        if (rand(100) % 100) == 0
          hash2 = hashtags[rand(hashtags.size)]
          sent << hash2
        end

        tweet = sent.join(' ')

        user = rand(1000000) + 1

        logline = "#{timestamp},#{user},#{tweet}"
        #puts logline
        f.write "#{logline}\n"
      end
    end
  end
end

threads.each {|t| t.join}
