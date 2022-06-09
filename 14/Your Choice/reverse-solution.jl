first_element_check = 1
element_check = 1
first_element = 0
num_of_boxes = 0
p_id = 0
visited = Set([])
counter = 0


function numeric_inputs(line)
  pair = split(line, " ",keepempty=false)
  println("pair: ",pair)
  return pair[1],pair[2]
end
function eliminate(line)
  for i in 1:length(line)
    if line[i] == 'N' || line[i] == '-'
      push!(visited,i)
    end
  end
end
function new_p_id(line)
  for i in 1:length(line)
    if i in visited
      continue
    elseif 'Y' in line
      if line[i] == 'Y'
        return i
      end
    else
      return -1
    end
  end
end
    
function body()
  for line in eachline("/Users/berademirhan/Desktop/14/Your Choice/sample.in")
    global first_element,element_check,first_element_check,num_of_boxes,p_id,counter
    counter = counter + 1
    p_id_track = []
    if first_element_check==1
      first_element = line
      first_element_check = first_element_check+1
    elseif element_check == 1
      element_check = element_check+1
      num_of_boxes, p_id = numeric_inputs(line)
      dummy_id = parse(Int64,p_id)
      dummy_num = parse(Int64,num_of_boxes)
      push!(p_id_track,p_id)
    else
      global dummy_id,dummy_num
      if dummy_id == 0
        dummy_id = dummy_id-1
      else
        eliminate(line)
        if length(visited) == num_of_boxes
          return p_id_track
        else
          p_id = new_p_id(line)
          push!(p_id_track,p_id)
          if p_id == -1

            return p_id
          else
            element_check += 1
          end
          
          if element_check == dummy_num+1
            return p_id_track
          elseif counter == dummy_num
            counter = 0
            element_check = 1
            return -1
          end
        end
      end
    end
  end
end

function main()
  if body() == -1
    print("IMPOSSIBLE")
  else
    lst = body()
    println(lst)
  end
end
main()
