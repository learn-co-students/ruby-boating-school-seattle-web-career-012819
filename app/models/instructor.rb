class Instructor
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def pass_student(student, name)
    t = (BoatingTest.all.select { |b| b.student == student && b.name == name }
    !!(t) ? t.status = "passed" : t = BoatingTest.new(student, name, "passed", self)
    t
  end

  def fail_student(student, name)
    t = (BoatingStudent.all.select { |b| b.student == student && b.name == name }
    !!(t) ? t.status = "failed" : t = BoatingTest.new(student, name, "failed", self)
    t
  end
end
