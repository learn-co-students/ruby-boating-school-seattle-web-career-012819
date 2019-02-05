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

  def boating_tests
    BoatingTest.all.select { |boating_test| boating_test.student == self }
  end

  def instructors
    self.boating_tests.map { |boating_test| boating_test.instructor }
  end

  def add_boating_test(boat_test_name, boat_test_status, instructor)
    #binding.pry
    BoatingTest.new(self, boat_test_name, boat_test_status, instructor)
  end

  def self.find_student(first_name)
    @@all.select { |student| student.first_name == first_name }
  end

  def grade_percentage
    status_array = self.boating_tests.map { |boat_test| boat_test.status}
    status_array_value = status_array.map do |status|
      if status == "passed"
        1
      else
        0
      end
    end
    avg_percent = status_array_value.sum.fdiv(status_array_value.size) * 100
    end

end
