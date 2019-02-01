class BoatingTest
  attr_accessor :student, :test_name, :status, :instructor

  @@all = []

  def initialize(student, test_name, status = pending, instructor)
    @student = student
    @status = status
    @test_name = test_name
    @instructor = instructor
    @@all << self
  end

  def self.all
    @@all
  end
end
