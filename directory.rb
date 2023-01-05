def input_students
  puts "Please enter the names, hobby and dob of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  $students = []
  # get the first name
  name = gets.chomp
  hobby = gets.chomp
  dob = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    $students << {name: name, cohort: :november, hobby: hobby, DOB: dob}
    puts "Now we have #{$students.count} students"
    # get another name from the user
    name = gets.chomp
    hobby = gets.chomp
    dob = gets.chomp
  end
  # return the array of students
  $students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 1
  while $students.length >= i
    puts "#{i}. #{$students[i-1][:name]} (#{$students[i-1][:cohort]} cohort)
    hobby: #{$students[i-1][:hobby]} DOB: #{$students[i-1][:DOB]}"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

$students = input_students
print_header
print($students)
print_footer($students)