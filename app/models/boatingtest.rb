class BoatingTest
  attr_accessor :first_name, :status, :instructor, :testname

  @@all = []

  def initialize(first_name, testname, status = 'pending', instructor)
    @first_name = first_name
    @testname = testname
    @status = status
    @instructor = instructor
    @@all << self
  end

  def self.all
    @@all
  end
end
