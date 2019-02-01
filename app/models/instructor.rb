class Instructor
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def get_test(testname)
    BoatingTest.all.find {|test| test.title == testname}
  end

  def pass_student(student, testname)
    test = get_test(testname)

    if test == nil
      bt = BoatingTest.new(student, testname, "passed", self)
      bt
    else
      test.status = "passed"
      test
    end
  end

  def fail_student(student, testname)
    test = get_test(testname)

    if test == nil
      bt = BoatingTest.new(student, testname, "failed", self)
      bt
    else
      test.status = "failed"
      test
    end
  end
end
