$months = ["january", "febuary", "march", "april", "may", "june", "july", "august",
  "september", "obctober", "november", "december"]

$students = []

def input_students
  puts "Please enter the names, start month, hobby and date of birth 'dd/mm/yyyy' of the students"
  puts "To finish, just hit return repeatedly without any input"
  # create an empty array
  # get the first name
  name = gets.chomp
  month = gets.chomp
  hobby = gets.chomp
  dob = gets.chomp
  # while the name is not empty, repeat this code
  while (!name.empty? && !month.empty? && !hobby.empty? && !dob.empty?) do
    # add the student hash to the array
    if $months.include?(month.downcase)
      $students << {name: name, cohort: month, hobby: hobby, DOB: dob}
    else
      $students << {name: name, cohort: "no month inputted for", hobby: hobby, DOB: dob}
    end
    if $students.count == 1
      puts "Now we have #{$students.count} student"
    elsif $students.count > 1
      puts "Now we have #{$students.count} students"
    end
    # get another name from the user
    name = gets.chomp
    month = gets.chomp
    hobby = gets.chomp
    dob = gets.chomp
  end
  # return the array of students
  puts $students
end


def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      $students = input_students
    when "2"
      print_header
      print($students)
      print_footer($students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def print_header
  puts
  puts "The students of Villains Academy".center(30, '-')
  puts "-------------".center(30)
end

def print_students_list(students)
  i = 1
  $sorted_hash = $students.sort_by { |h| h[:cohort] }
  while $students.length >= i
    puts "#{i}. #{$sorted_hash[i-1][:name]} (#{$sorted_hash[i-1][:cohort]} cohort)".center(35)
    puts "hobby: #{$sorted_hash[i-1][:hobby]} DOB: #{$sorted_hash[i-1][:DOB]}".center(30)
    i += 1
  end
end

def print_footer(names)
  centered_str = "Overall, we have #{names.count} great students".center(41, '-')
  puts centered_str
  puts
end

def show_students
  print_header
  print_students_list($sorted_hash)
  print_footer($students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  $students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:DOB]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, hobby, dob = line.chomp.split(',')
    $students << {name: name, cohort: cohort, hobby: hobby, DOB: dob}
  end
  file.close
end

interactive_menu