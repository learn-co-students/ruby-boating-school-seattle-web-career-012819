require 'pry'

class Student
  attr_reader :first_name
  @@all = []
  def initialize(first_name)
    @first_name = first_name
    @@all.append(self)
  end

  def self.all
    @@all
  end

def add_boating_test(test_name, status, instructor)
  BoatingTest.new(self, test_name, status, instructor)
end

def self.find_student(student_first_name)
  all.select {|x| x.first_name == student_first_name}
end

def grade_percentage
  tests_taken = BoatingTest.all.select {|test| test.student.first_name == self.first_name}.count
  tests_passed = BoatingTest.all.select {|test| test.student.first_name == self.first_name && test.status == "passed"}.count
  (tests_passed.to_f/tests_taken.to_f) * 100
end

end