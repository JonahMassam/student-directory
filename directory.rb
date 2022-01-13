# let's put all students into an array

@box_size = 50
@students = []

def input_students()
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    puts "Hobby:"
    hobby = gets.chomp
    puts "Country of birth:"
    cob = gets.chomp
    puts "Height"
    height = gets.chomp
    @students << {name: name, cohort: :january, hobby: hobby , birth_country: cob, height: height }
    puts "There is now #{@students.count} students"
    name = gets.chomp
  end
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

def save_students
  file = File.open("students.csv", "w")
  for student in @students
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  for line in file.readlines
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do
    puts "1. Input Students"
    puts "2. Show Students"
    puts "3. Save students"
    puts "4. Load students"
    puts "9. Exit"

    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(@students)
      print_footer(@students)
    when "3"
      save_students()
      puts "File saved"
    when "4"
      load_students()
      puts "File loaded"
    when "9"
      exit
    else 
      puts "Unknown command"
    end
  end
end


interactive_menu