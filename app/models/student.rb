class Student

  attr_reader :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name

    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, status = "pending", instructor)
    BoatingTest.new(student: self,
                    test_name: test_name,
                    instructor: instructor,
                    status: status)
  end

  def self.find_student(first_name)
    self.all.find{|student| student.first_name == first_name}
  end

  def grade_percentage
    test_num = self.boating_tests.count
    pass_num = self.boating_tests.select{|test| test.status == "passed"}.count
    (test_num > 0) ? (pass_num.to_f / test_num) * 100 : "This student hasn't finished any tests"
  end

  def boating_tests
    tests = BoatingTest.all.select{|test| test.student == self}
  end

  def instructors
    self.boating_tests.collect{|test| test.instructor}
  end

end
