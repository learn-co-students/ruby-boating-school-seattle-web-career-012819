class Instructor

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def pass_student(student,test_name)
    BoatingTest.all.select do |test|
      if test.student == student && test.boating_test_name == test_name
        test.boating_test_status = "passed"
        return test
      end
    end
    BoatingTest.new(student,test_name,"passed",self)
    return BoatingTest.all.last
  end

  def fail_student(student,test_name)
    BoatingTest.all.select do |test|
      if test.student == student && test.boating_test_name == test_name
        test.boating_test_status = "failed"
        return test
      end
    end
    BoatingTest.new(student,test_name,"failed",self)
    returning BoatingTest.all.last
  end

end
