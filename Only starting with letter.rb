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
  puts "What letter: "
  letter = gets.chomp
  names.each_with_index { |student, index|  if student[:name][0,1] == letter then puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)" end }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

