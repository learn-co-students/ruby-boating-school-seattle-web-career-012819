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
    if Instructor.find_test(student, test_name)
       Instructor.find_test(student, test_name).test_status = 'passed'
       Instructor.find_test(student, test_name)
    else
    return  BoatingTest.new(student, test_name, test_status = 'passed', self)
    end
  end

  def fail_student(student, test_name)
    if Instructor.find_test(student, test_name)
       Instructor.find_test(student, test_name).test_status = 'failed'
       Instructor.find_test(student, test_name)
      else
      return  BoatingTest.new(student, test_name, test_status = 'failed', self)
      end

  end




end
