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

  def boating_tests
    BoatingTest.all.select { |boating_test| boating_test.instructor == self }
  end

  def students
    self.boating_tests.map { |boating_test| boating_test.student }
  end

  def pass_student(student, boat_test_name)
    self.boating_tests.each do |boat_test|
      if boat_test.student == student && boat_test_name == boat_test.name
        boat_test.status = "passed"
        return
      end
    end
    BoatingTest.new(student, boat_test_name, "passed", self)
  end

  def fail_student(student, boat_test_name)
    self.boating_tests.each do |boat_test|
      if boat_test.student == student && boat_test_name == boat_test.name
        boat_test.status = "failed"
        return
      end
    end
    BoatingTest.new(student, boat_test_name, "failed", self)
  end
end
