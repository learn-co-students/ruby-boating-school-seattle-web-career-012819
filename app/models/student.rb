class Student
  @@all = []

  attr_accessor :first_name

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end

  def find_tests
    BoatingTest.all.select{|test| test.student == self}
  end

  def grade_percentage
    total_tests = self.find_tests.count
    passed_tests = self.find_tests.select{|test| test.test_status == "passed"}.count
    (passed_tests.to_f / total_tests.to_f) * 100
  end

  def self.all
    @@all
  end

  def self.find_student(first_name)
    self.all.find{|student| student.first_name == first_name}
  end
end
