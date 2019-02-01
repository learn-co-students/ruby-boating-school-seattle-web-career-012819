class Student
  attr_reader :firstname
  @@all = []

  def initialize(firstname)
    @firstname = firstname
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(title, status, instructor)
    test = BoatingTest.new(self, title, status, instructor)
  end

  def self.find_student(firstname)
    self.all.find do |student|
      student.firstname == firstname
    end
  end

  def get_test
    BoatingTest.all.select do |test|
      test.student == self
    end
  end

  def grade_percentage
    passing = 0.0
    failing = 0.0

    get_test.each do |test|
      if test.status == "failed"
        failing += 1
      elsif test.status == "passed"
        passing += 1
      end
    end
    (passing / (passing + failing))*100
  end
end
