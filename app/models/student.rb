class Student
  attr_reader :first_name

  @@all =[]

  def initialize(name)
    @first_name = name
    @@all << self
  end

  def self.find_student(name)
    students = self.all
    students.find do |student|
      student.first_name == name
    end
  end

  def self.all
    @@all
  end

  #should initialize a new boating test with a Student (Object),
  #a boating test name (String), a boating test status (String),
  #and an Instructor (Object)
  def add_boating_test(name, status, instructor)
    BoatingTest.new(self, name, status, instructor)
  end
end
