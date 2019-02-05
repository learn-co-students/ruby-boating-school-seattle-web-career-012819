require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)


#Testing for instructor.pass_student
bob = Student.new("Bob")
teacher_man = Instructor.new("Teacher Man")
oil_change = BoatingTest.new(bob, "Oil Change", 'pending', teacher_man)
puts "Student #{bob.first_name} wants to take a #{oil_change.test_name} test from professor #{teacher_man.name}."
puts "He is expecting to pass the test."
teacher_man.pass_student(bob, "Oil Change")
puts "And he #{oil_change.test_status}."

#Testing for instructor.fail_student
chelsea = Student.new("Chelsea")
teacher_woman = Instructor.new("Teacher Woman")
tire_change = BoatingTest.new(chelsea, "Tire Change", 'pending', teacher_woman)
puts "Student #{chelsea.first_name} wants to take a #{tire_change.test_name} test from professer #{teacher_woman.name}."
puts "She is expecting to fail the test"
teacher_woman.fail_student(chelsea, "Tire Change")
puts "And she #{tire_change.test_status}."

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
