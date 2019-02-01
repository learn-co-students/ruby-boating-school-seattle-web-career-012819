class Student

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, status, instructor)
    BoatingTest.new(self, test_name, status, instructor)
  end

  def self.find_student(name)
    self.all.select do |student|
      student.name == name
    end
  end

  def tests
    BoatingTest.all.select do |test|
      test.student == self
    end
  end

  def grade_percentage
    students_tests = self.tests
    total_score = students_tests.reduce(0) do |total, test|
      total += test.status == "passed" ? 1 : 0
    end
    total_score / (students_tests.length * 1.0)
  end

end
