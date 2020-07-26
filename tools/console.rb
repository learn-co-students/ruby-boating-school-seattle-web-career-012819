require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Testing for instructor.pass_student
bob = Student.new("Bob")
teacher_man = Instructor.new("Teacher Man")
oil_change = BoatingTest.new(bob, "Oil Change", teacher_man, 'pending')
puts "Student #{bob.first_name} wants to take a #{oil_change.test_name} test from professor #{teacher_man.name}."
puts "He is expecting to pass the test."
teacher_man.pass_student(bob, "Oil Change")
puts "And he #{oil_change.status}."

bob.all_tests

#Testing for instructor.fail_student
chelsea = Student.new("Chelsea")
teacher_woman = Instructor.new("Teacher Woman")
tire_change = BoatingTest.new(chelsea, "Tire Change", teacher_woman, 'pending')
puts "Student #{chelsea.first_name} wants to take a #{tire_change.test_name} test from professer #{teacher_woman.name}."
puts "She is expecting to fail the test"
teacher_woman.fail_student(chelsea, "Tire Change")
puts "And she #{tire_change.status}."

mr_student = Student.new("MrStudent")
instructor_man = Instructor.new("InstructorMan")

first_test = mr_student.add_boating_test("Float 101", "pending", instructor_man)
second_test = mr_student.add_boating_test("You will always pass.", "pending", instructor_man)

# first_test_failed = instructor_man.fail_student()

spongebob = Student.new("Spongebob")
patrick = Student.new("Patrick")

puts Student.find_student("Spongebob").first_name
puts Student.find_student("Patrick").first_name
 
puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")
 
no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
no_crashing2 = spongebob.add_boating_test("Don't Crash 201", "pending", puff)

no_crashing3 = patrick.add_boating_test("Don't Crash 301", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)
puff.pass_student(patrick, "asdad")
puff.pass_student(patrick, "zxczxc")
puff.fail_student(patrick, "qqqqqq")
puff.pass_student(patrick, "1111")
puff.pass_student(patrick, "2222")
puff.fail_student(patrick, "3333")
puff.pass_student(patrick, "44444")
puff.pass_student(patrick, "55555")
puff.pass_student(patrick, "6666")
puff.pass_student(patrick, "7777")

puts patrick.grade_percentage


binding.pry
0 #leave this here to ensure binding.pry isn't the last line