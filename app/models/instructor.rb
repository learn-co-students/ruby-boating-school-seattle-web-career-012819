class Instructor

  attr_accessor :name, :test_status

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_test(student, test_name)
     BoatingTest.all.find{|test| test.test_name == test_name && test.student == student}
  end

  def pass_student(student, test_name)
    test = Instructor.find_test(student, test_name)
    if test
       test.test_status = 'passed'
       test
    else
    return  BoatingTest.new(student, test_name, test_status = 'passed', self)
    end
  end

  def fail_student(student, test_name)
    test = Instructor.find_test(student, test_name)
    if test
       test.test_status = 'failed'
       test
    else
      return  BoatingTest.new(student, test_name, test_status = 'failed', self)
    end
  end

end
