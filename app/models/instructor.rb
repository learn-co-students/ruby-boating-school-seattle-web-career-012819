class Instructor

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end
  
  def pass_student(student, test_name)
    test = student.tests.select do |test|
      test.test_name == test_name
    end
    if test.empty?
      BoatingTest.new(student, test_name, "passed", self)
    else
      test[0].status = "passed"
    end
  end

  def fail_student(student, test_name)
    test = student.tests.select do |test|
      test.test_name == test_name
    end
    if test.empty?
      BoatingTest.new(student, test_name, "failed", self)
    else
      test[0].status = "failed"
    end
  end

end
