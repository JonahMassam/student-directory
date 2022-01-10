# let's put all students into an array

@box_size = 50

def input_students()
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Hobby:"
    hobby = gets.chomp
    puts "Country of birth:"
    cob = gets.chomp
    puts "Height"
    height = gets.chomp
    students << {name: name, cohort: :january, hobby: hobby , birth_country: cob, height: height }
    puts "There is now #{students.count} students"
    name = gets.chomp
  end
  return students
end

def print_header
  puts "The students of Villains Academy".center(@box_size, "-")
  puts " "
end

def print(names)
  puts "-" * @box_size
  names.each_with_index { |student, index| puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)".center(@box_size, "-") }
  puts "-" * @box_size
  puts ""
end

def print_footer(names)
  names.count == 1 ? test = "" : test = "s"
  puts "Overall, we have #{names.count} great student#{test}."
end

#-------------------------

def print_with_initial(names)
  puts "What letter: "
  letter = gets.chomp
  names.each_with_index { |student, index|  if student[:name][0,1] == letter then puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)" end }
end

def print_shorter_than_12(names)
  names.each_with_index { |student, index| if student[:name].length < 12 then puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)" end }
end

def print_using_while(names)
  counter = 0
  while counter < names.length
    puts "#{counter}: #{names[counter][:name]} (#{names[counter][:cohort]} cohort)"
    counter += 1
  end
end


def interactive_menu
  students = []
  loop do
    puts "1. Input Students"
    puts "2. Show Students"
    puts "9. Exit"

    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else 
      puts "Unknown command"
    end
  end
end


interactive_menu