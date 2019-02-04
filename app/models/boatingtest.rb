class BoatingTest

  attr_reader :student, :test_name, :instructor
  attr_accessor  :status

  @@all = []

  def initialize(student: nil, test_name: "", status: "pending", instructor: nil)
    @student = student
    @test_name = test_name
    @status = status
    @instructor = instructor

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_test(student, instructor, test_name)
    self.all.find{|test| test.student == student
                        && test.instructor == instructor
                        && test.test_name == test_name}
  end

end
