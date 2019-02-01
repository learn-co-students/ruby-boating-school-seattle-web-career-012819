class BoatingTest
attr_accessor :student, :test_name, :test_status, :instructor
  @@all = []

  def initialize(student, test_name, test_status, instructor)
    @student = student
    @test_name = test_name
    @test_status = test_status
    @instructor = instructor

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_test(student, test_name)
     self.all.find{|test| test.test_name == test_name && test.student == student}
  end
end
