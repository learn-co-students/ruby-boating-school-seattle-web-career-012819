require 'pry'
class Student

  attr_reader :first_name
  @@all = []

def initialize(name)
  @first_name = name
  @@all << self
end

def self.all
  @@all
end

def add_boating_test(test_name, test_status, instructor)
  BoatingTest.new(self, instructor, test_name, test_status)
end

def self.find_student(by_first_name)
  self.all.find do |name|
     name.first_name == by_first_name
  end
end

def grade_percentage
  count = 0
  pass_count = 0
  BoatingTest.all.each do |grade|
    count += 1
    if grade.test_status == "passed"
      pass_count += 1
    end
  end
  pass_count / count.to_f
end
#binding.pry
end#end of class
