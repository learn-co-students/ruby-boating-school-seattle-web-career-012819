class Instructor
  attr_reader :first_name

  @@all =[]

  def initialize(name)
    @first_name = name
    @@all << self
  end

  def self.all
    @@all
  end

  #If there is a BoatingTest whose name and student match the values
  #passed in, this method should update the status of that BoatingTest
  # to 'passed'. If there is no matching test, this method should
  #create a test with the student, that boat test name, and the status
  # 'passed'. Either way, it should return the BoatingTest instance.
  def pass_student(student, name)
    my_students_tests = get_students_of_instructor

    found = find_student(student, my_students_tests)
    found = find_tests(name, found)
    if found != nil
      found.status = "passed"
    else
      BoatingTest.new(student, name, "passed", self)
    end
  end

  def fail_student(student, test_name)
    my_students_tests = get_students_of_instructor

    found = find_student(student, my_students_tests)
    found = find_tests(test_name, found)
    if found != nil
      found.status = "failed"
    else
      BoatingTest.new(student, test_name, "failed", self)
    end
  end

  def find_student(student, students_test)
    #puts "finding specific one"
    students_test.select { |test| test.student == student }
  end

  def find_tests(test_name, students_test)
    #puts "finding specific one"
    students_test.find { |test| test.name == test_name }
  end

  def get_students_of_instructor
    #puts "getting students"
    BoatingTest.all.select do |test|
      test.instructor == self
    end
  end
end
