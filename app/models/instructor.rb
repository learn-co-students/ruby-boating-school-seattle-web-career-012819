class Instructor
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def pass_student(student, test_name_find)
    tests = BoatingTest.all.select do |test|
      student == test.student
    end
    found_test = tests.find do |test|
      test.test_name == test_name_find
    end
    if found_test == nil
      BoatingTest.new(student, "passed", test_name_find, self)
    else
      found_test.status = "passed"
    end
  end

  def fail_student(student, test_name_find)
    tests = BoatingTest.all.select do |test|
      student == test.student
    end
    found_test = tests.find do |test|
      test.test_name == test_name_find
    end
    if found_test == nil
      BoatingTest.new(student, "failed", test_name_find, self)
    else
      found_test.status = "failed"
    end
  end
end
