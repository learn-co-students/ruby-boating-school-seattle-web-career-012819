class Instructor
@@all = []
attr_accessor :name
def initialize(name)
  @name=name
  @@all << self
end

def self.all
  @@all
end

def pass_student(student, test_name)
#should take in a student instance and test name.
  BoatingTest.all.each do |test|
    if test.student.first_name == student.first_name && test.test_name == test_name
      test.test_status = "passed"
    else
      BoatingTest.new(student, test_name, "passed", self)
    end
  end
end

def fail_student(student, test_name)
#should take in a student instance and test name.
  BoatingTest.all.each do |test|
    if test.student.first_name == student.first_name && test.test_name == test_name
      test.test_status = "failed"
    else
      BoatingTest.new(student, test_name, "failed", self)
    end
  end
end

end
