class Student

  attr_accessor :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def add_boating_test(testname, status, instructor)
    BoatingTest.new(self, testname, status, instructor)
  end

  def self.all
    @@all
  end

  def self.find_student(first_name)
    self.all.select do |student|
      student.first_name == first_name
    end
  end

  def tests
    BoatingTest.all.select do |test|
      test.first_name == self
    end
  end

  def grade_percentage
    total_tests = self.tests
    tests_passed = total_tests.reduce(0) do |pass, test|
      pass += test.status == 'passed' ? 1 : 0
    end
    tests_passed * 100 / (total_tests.size * 1.0)
  end

end
