require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

spongebob = Student.new("Sponge Bob")
patrick = Student.new("Patrick")

mrsPuff = Instructor.new("Mrs. Puff")
krabs = Instructor.new("Mr. Krabs")

#test find students method
#puts Student.find_student("Patrick").first_name

#test add_boating_test
spongebob.add_boating_test("Don't Crash 101", "passed", mrsPuff)
patrick.add_boating_test("Don't Crash 101", "failed", mrsPuff)

spongebob.add_boating_test("Power Steering 201", "passed", krabs)
patrick.add_boating_test("Power Steering 202", "failed", krabs)

#test changing the status of tests
mrsPuff.pass_student(patrick, "Don't Crash 101")
puts BoatingTest.all[1].status
mrsPuff.fail_student(spongebob, "Don't Crash 101")
puts BoatingTest.all[0].status

#test mr krabs failing a student who hadnt taken this test before
krabs.fail_student(spongebob, "Power Steering 202")
puts BoatingTest.all[4].status

#test mr krabs passing a student who hadnt taken this test before
krabs.pass_student(patrick, "Power Steering 201")
puts BoatingTest.all[5].status
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#binding.pry
0 #leave this here to ensure binding.pry isn't the last line
