class Student
  @@all = []
  attr_accessor :first_name
  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(student, name, status, instructor)
    BoatingTest.new(student, name, status, instructor)
  end

  def self.find_student(first_name)
    self.all.select { |s| s.first_name == first_name }
  end

  def grade_percentage
    total = BoatingTest.all.collect{ |t| t.student == self }.
    passed = total.select
    (BoatingTest.all.select { |t| t.student == self && t.passed } / BoatingTest.all.collect{ |t| t.student == self }).to_i
  end
end
