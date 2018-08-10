$array = [54,548,546,60]#[4,90,645,96,540,60,5]#[9,3,30,34,5]#[54,548,546,60]
$array.sort!
$b = $array
$final_array = []

def main
  one_array =[]
  tens_array = []
  third_array =[]
  max_length = $array.max.to_s.length
    $array.each do |val|
      p "val: #{val.to_s.length}"
      c = $array
      p "c #{c}"
      if val.to_s.length == 1
        one_array << val
        #once_value(on,val,1)
      elsif val.to_s.length == 2
        tens_array << val
        #tens_vals(c,val,2)
      elsif val.to_s.length == 3
        third_array << val
        #third_val(c,val,3)
      end
    end
    p "ones_array: #{one_array}"
    p "Second_array: #{tens_array}"
    p "third_array: #{third_array}"
    p 'final-arry'
    result =  find_greater one_array, tens_array,third_array,$array,[]
    p result
    p "result: #{result.join}"
end

def array_nul_chk one_array,second_array,third_array
  if !one_array.empty?
    max_one = one_array.max
  else
    max_one= 0
  end
  if !second_array.empty?
    max_second = second_array.max
  else
    max_second= 0
  end
  if !third_array.empty?
    max_third = third_array.max
  else
    max_third= 0
  end
  return max_one,max_second,max_third
end

def find_greater one_array, second_array,third_array,array,final_array
  if !array.empty?
    array.each do |bc|
      p array
      if bc.to_s.length == 1
        max_one,max_second,max_third = array_nul_chk one_array,second_array,third_array
        if ((max_one <= bc) && (max_second <= (bc * 10)) && (max_third <= (bc * 100)))
          final_array << bc
          one_array.delete(bc)
          array.delete(bc)
          find_greater one_array, second_array,third_array,array,final_array
        end
      elsif bc.to_s.length == 2
        max_one,max_second,max_third = array_nul_chk one_array,second_array,third_array
        if (((max_one * 10) <= bc) && (max_second <= bc) && (max_third <= (bc * 10)))
          final_array << bc
          second_array.delete(bc)
          array.delete(bc)
          find_greater one_array, second_array,third_array,array,final_array
        end
      elsif bc.to_s.length == 3
        max_one,max_second,max_third = array_nul_chk one_array,second_array,third_array
        if ((( max_one * 100) <= bc) && ((max_second * 10) <= bc) && (max_third <= (bc)) )
          final_array << bc
          third_array.delete(bc)
          array.delete(bc)
          find_greater one_array, second_array,third_array,array,final_array
        end
      end

    end
  end
  final_array
end

main
