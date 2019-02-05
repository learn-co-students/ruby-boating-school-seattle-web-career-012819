class Instructor
attr_accessor :name 
@@all = []

def initialize(name)
  @name = name 
  @@all << self 
end 

def self.add 
  @@all 
end 



def pass_student(student, test_name)
  BoatingTest.all.collect do |boat|
    if boat.student == student && boat.test_name == test_name
      boat.test_status = "passed"
    elsif
      BoatingTest.new(student, test_name, "passed", self)
    end 
  end
end 


def fail_student(student, test_name)
  BoatingTest.all.collect do |boat|
    if boat.student == student && boat.test_name == test_name
      boat.test_status = "failed"
    elsif
      BoatingTest.new(student, test_name, "failed", self)
    end 
  end
end 




end # End Instructor class
