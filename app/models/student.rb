class Student

  attr_accessor :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name

    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(boating_test_name,boating_test_status,instructor)
    BoatingTest.new(self,boating_test_name,boating_test_status,instructor)
  end

  def self.find_student(first_name)
    Student.all.select do |student|
      if student.first_name == first_name
        return student
      end
    end
  end

  def grade_percentage
    pass_count = 0
    fail_count = 0
    BoatingTest.all.select do |test|
      if test.student == self
        if test.boating_test_status == "passed"
          pass_count += 1
        elsif test.boating_test_status == "failed"
          fail_count += 1
        end
      end
    end
    total = pass_count + fail_count
    return pass_count.to_f/total
  end

end
