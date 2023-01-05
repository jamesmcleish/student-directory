$months = ["january", "febuary", "march", "april", "may", "june", "july", "august",
  "september", "obctober", "november", "december"]
  puts "Please enter the names, start month, hobby and dob of the students"
  puts "To finish, just hit return repeatedly without any input"
def input_students
  # create an empty array
  $students = []
  # get the first name
  name = gets.chomp
  month = gets.chomp
  hobby = gets.chomp
  dob = gets.chomp
  # while the name is not empty, repeat this code
  while (!name.empty? && !month.empty? && !hobby.empty? && !dob.empty?) do
    # add the student hash to the array
    if !month.empty? && $months.include?(month.downcase)
      $students << {name: name, cohort: month, hobby: hobby, DOB: dob}
    elsif 
      $students << {name: name, cohort: "no month inputted for", hobby: hobby, DOB: dob}
    end
    puts "Now we have #{$students.count} students"
    # get another name from the user
    name = gets.chomp
    month = gets.chomp
    hobby = gets.chomp
    dob = gets.chomp
  end
  # return the array of students
  $students
end

def print_header
  puts "The students of Villains Academy".center(30, '-')
  puts "-------------".center(30)
end

def print(students)
  i = 1
  while $students.length >= i
    puts "#{i}. #{$sorted_hash[i-1][:name]} (#{$sorted_hash[i-1][:cohort]} cohort)".center(35)
    puts "hobby: #{$sorted_hash[i-1][:hobby]} DOB: #{$sorted_hash[i-1][:DOB]}".center(30)
    i += 1
  end
end

def print_footer(names)
  centered_str = "Overall, we have #{names.count} great students".center(41, '-')
  puts centered_str
end

$students = input_students

$sorted_hash = $students.sort_by { |h| h[:cohort] }

print_header
print($sorted_hash)
print_footer($students)