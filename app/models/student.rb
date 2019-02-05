class Student
attr_accessor :first_name
@@all = []

def initialize(first_name)
  @first_name = first_name
  
  @@all << self 
end 

def self.all 
  @@all 
end 


def add_boating_test(test_name, test_status, instructor)
  BoatingTest.new(self, test_name, test_status, instructor)
end 


def self.find_student(first_name)
  @@all.find do |student|
    student.first_name
  end 
end 
 

def grade_percentage
  test_passed = 0 
  test_failed = 0
  BoatingTest.all.select do |boat|
    if boat.student == self && boat.test_status == "passed"
      test_passed += 1
    elsif boat.student == self && boat.test_status == "failed"
      test_failed += 1
    end 
  end 
  percent = (test_passed/(test_failed+test_passed).to_f) * 100 
    # binding.pry
end 

end # End Student Class 
