first_element_check = 1
element_check = 1
first_element = 0
num_of_boxes = 0
p_id = 0
visited = Set([])

function numeric_inputs(line)
  pair = split(line, " ",keepempty=false)
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
  for line in eachline("/Users/berademirhan/Desktop/COMP 305/14/Your Choice/sample.in")
    global first_element,element_check,first_element_check,num_of_boxes,p_id
    p_id_track = []
    if first_element_check==1
      first_element = line
      first_element_check = first_element_check+1
    elseif element_check == 1
      element_check = element_check+1
      num_of_boxes, p_id = numeric_inputs(line)
      dummy_id = parse(Int64,p_id)
      push!(p_id_track,p_id)
      println("p_id reference 1: ",p_id)
    else
      global dummy_id
      if dummy_id == 0
        println("line 48: ",p_id," ",dummy_id)
        dummy_id = dummy_id-1
      else
        println("p_id line: ",line)
        println("line 51: ",p_id," ",dummy_id)
        eliminate(line)
        println("visited: ",visited)
        if length(visited) == num_of_boxes
          println("line 54: ",p_id," ",dummy_id)
          return p_id_track
        else
          println("line 57: ",p_id," ",dummy_id)
          p_id = new_p_id(line)
          push!(p_id_track,p_id)
          println("p_id reference 2: ",p_id)
          if p_id == -1
            println("line 62: ",p_id)
            return p_id
            println("p_id reference 3: ",p_id)
          else
            println("line 67: ",p_id)
            element_check = 1
            continue
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