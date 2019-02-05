class Instructor

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def pass_student(student, test_name)
    BoatingTest.all.find do |test|
      if test.name == test_name && test.student == student
        test.status = 'passed'
        return test
      end
    end
    BoatingTest.new(student, test_name, 'passed', self)
  end


end
#end of Instructor class
