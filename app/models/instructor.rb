class Instructor

  attr_reader :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name

    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, status = "pending", student)
    BoatingTest.new(student: student,
                    test_name: test_name,
                    instructor: self,
                    status: status)
  end

  def pass_student(student, test_name)
    test = BoatingTest.find_test(student, test_name, self)
    raise "Test doesnt exist" unless test
    test.status = "passed"
  end

  def fail_student(student, test_name)
    test = BoatingTest.find_test(student, test_name, self)
    raise "Test doesn't exist" unless test
    test.status = "failed"
  end

  def boating_tests
    BoatingTest.all.select{|test| test.instructor == self}
  end

  def students
    self.boating_tests.collect{|test| test.student}
  end


end
