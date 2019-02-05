class Instructor
  attr_reader :name
  @@all = []
  def initialize(name)
    @name = name
    @@all.append(self)
  end
  
  def self.all
    @@all
  end

  def pass_student(student, test_name)
    find_test = BoatingTest.all.find{|test| test.student.first_name == student.first_name && test.test_name == test_name}
    if find_test
      find_test.status = "passed"
    else
      BoatingTest.new(student, test_name, "pending", self)
    end
  end

  def fail_student(student, test_name)
    testtofail= BoatingTest.all.find{|test| test.student.first_name == student.first_name && test.name == test_name}
    if testtofail
      testtofail.status= "failed"
    else
      BoatingTest.new(student, test_name, "failed", self)
    end
  end
end
