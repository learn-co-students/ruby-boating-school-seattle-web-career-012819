class BoatingTest
  attr_accessor :student, :instructor, :test_name, :test_status
  @@all = []
  def initialize(student, instructor, test_name, test_status)
    @student = student
    @instructor = instructor
    @test_name = test_name
    @test_status = test_status
    @@all << self
  end

  def self.all
    @@all

  end
end
