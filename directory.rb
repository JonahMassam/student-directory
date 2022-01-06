# let's put all students into an array
def input_students()
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :january }
    puts "There is now #{students.count} students"
    name = gets.chomp
  end
  return students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each_with_index { |student, index| puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
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




students = input_students
print_header
print_using_while(students)
print_footer(students)


