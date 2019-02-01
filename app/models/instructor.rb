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

  def pass_student(first_name, testname)
    test = first_name.tests.select do |test|
      test.testname == testname
    end
    if test.size == 0
      BoatingTest.new(first_name, testname, 'passed', self)
    else
      test[0].status = 'passed'
    end
  end

  def fail_student(first_name, testname)
    test = first_name.tests.select do |test|
      test.testname == testname
    end
    if test.size == 0
      BoatingTest.new(first_name, testname, 'failed', self)
    else
      test[0].status = 'failed'
    end
  end
  
end
