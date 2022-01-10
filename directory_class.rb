class Student
  attr_accessor :name
  attr_accessor :cohort
  attr_accessor :hobby
  attr_accessor :country_of_birth
  attr_accessor :height

  def initialize(name)
    @name = name
  end
end

class Directory
  attr_accessor :current_students
  def initialize
    @current_students = []
  end

  def print_students(*args)
    puts "The students of Villains Academy"
    @current_students.each_with_index {|student, index| puts "#{index}: #{student.name}" }
  end

  def add_new_student(name)
    @current_students.append(Student.new(name))
  end

  def input_students
    puts "Please enter the students names, press Enter twice when finnished."
    puts "Enter student #{current_students.length}'s name: "
    new_student_name = gets.chomp
    while !new_student_name.empty? do
      add_new_student(new_student_name)
      puts "Added student: #{new_student_name}"
      puts "Enter student #{current_students.length}'s name: "
      new_student_name = gets.chomp
    end
  end

  def print_with_initial()
    puts "What letter: "
    letter = gets.chomp
    current_students.each_with_index { |student, index|  if student.name[0,1].downcase == letter.downcase then puts "#{index}: #{student.name}" end }
  end

  def print_shorter_than(length)
    if length.is_a? Integer
      current_students.each_with_index { |student, index| if student.name.length < length then puts "#{index}: #{student.name}" end }
    end
  end

  def set_info(cohort, hobby, country_of_birth, height)
    pass
  end


end



test = Directory.new()
test.add_new_student("joe")
test.add_new_student("stu")
test.add_new_student("ben")
test.current_students

ARGV.each do|a|
  puts "Argument: #{a}"
end
