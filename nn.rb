#!/bin/ruby

#
# Complete the repairRoads function below.
#
def repairRoads(n, roads)
    #
    # Write your code here.
    #

end

#fptr = File.open(ENV['OUTPUT_PATH'], 'w')

#t = gets.to_i
t = 3
t.times do |t_itr|
    #n = gets.to_i
    n = 4
    roads = Array.new(n-1)

    (n-1).times do |i|
        roads[i] = '0 1'.rstrip.split(' ').map(&:to_i)
    end

    result = repairRoads n, roads
    #fptr.write result
    #fptr.write "\n"
end

#fptr.close()
