class Student

  @@all = []

  attr_reader :first_name

  def initialize(first_name)
    @first_name = first_name
  end

  def self.all
    @@all
  end

  def add_boating_test(name, status, instructor)
    BoatingTest.new(self, name, status, instructor)
  end

  def self.find_student(student)
    BoatingTest.all.find do |x|
      x.first_name == student
    end
  end

  def find_test
    BoatingTest.all.select do |test|
      test.student == self
    end
  end
  
  def grade_percentage
    #spongebob.grade_percentage => 33.33
    passed = 0
    tests_taken = 0
    find_test.each do |x|
      tests_taken += 1
      if x == 'passed'
        passed += 1
      end
    end
    return (passed.to_f/tests_taken).round(2)
  end
end
#end of Student class
