class Student
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, status, instructor)
    BoatingTest.new(self, test_name, status, instructor)
  end

  def self.find_student(name)
    @@all.find do |student|
      name == student.name
    end
  end

  def boating_tests
    BoatingTest.all.select do |test|
      self == test.student
    end
  end

  def grade_percentage
    statuses = []
    pass_total = 0
    fail_total = 0
    boating_tests.each do |test|
      statuses << test.status
    end
    statuses.each do |status|
      if status == "passed"
        pass_total += 1
      elsif status == "failed"
        fail_total +=1
      end
    end
    (pass_total.to_f / (pass_total + fail_total).to_f)
  end


end
