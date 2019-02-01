class BoatingTest
    attr_accessor :status
    attr_reader :student, :title, :instructor
    @@all = []

  def initialize(student, title, status, instructor)
    @student = student
    @title = title
    @status = status
    @instructor = instructor
    @@all << self
  end

  def self.all
    @@all
  end

end
