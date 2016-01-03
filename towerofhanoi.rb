#user input is the initial height of the tower
#wrap everything in a class and focus on separating different functionality into methods
#create a game loop that finishes when the user either quits or wins
#check for valdi user inputs
#create a render method which prints out the current state of the game board between turns

#rules
#only move one disk at a time
#moves consist of taking the upper disk from oneof the stacks and placing it on top of another stack (assume the "upper most" is the last element in an array)
#no disk can be placed on top of a smaller disk




def user_input() #what do I pass here?
  puts "\nWhat is your move?"
  user_input = gets.chomp.split(",")
    
    move_array = user_input.map { |letter| letter.to_i}

  return move_array
  puts move_array
  #move is an array [starting rod, ending rod, disk]
end

#check if disk is the last element on the rod
#move.last is the disk the user would like to move
#needs to be equal to 
def check_disk_last(move_array, rods_array)
  if move_array.last == rods_array[move_array[0]].last
    puts "Disk is last element."
    return true
  end
end

#check the last element in the ending rod is smaller--in this case is less--than the user's selected disk
def check_endingrod_valid(move_array, rods_array)
  if rods_array[move_array[1]].length == 0
    puts "Disk can be moved to specified rod."
    return true
  elsif rods_array[move_array[1]].last < move_array.last
    puts "Disk can be moved to the specified rod."
    return true
  else 
    puts "Disk cannot be moved to the specified rod."
  end
end

def move_disk(move_array, rods_array)
  if check_disk_last(move_array, rods_array) == true and check_endingrod_valid(move_array, rods_array) == true
    rods_array[move_array[0]].pop
    rods_array[move_array[1]].push(move_array[2])
    print rods_array
  else 
    puts "Move not valid. Please try again."
  end
end


def tower_of_hanoi(height)
  puts  "Welcome to Tower of Hanoi! Please keep in mind the following rules. Remember yu may only move one disk at a time and disks can only be placed on top of smaller disks."

  puts "To move, please enter the starting rod, ending rod and the disk you would like to move, separated by commas. Good luck! "

  rods_array = [(1..height).to_a,Array.new,Array.new]
  until rods_array == [Array.new, Array.new, (1..height).to_a]
    move_disk(user_input(), rods_array)
    #want to call the user input then call move_disk then goes back to tower of hanoi? can i do this since user_input returns the move_array?
  end
  puts "\nYou WIN!"
end