class Instructor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def pass_student(student, test_name)
        # update test that has student to passed
        if BoatingTest.all.any? {|test| test.test_name == test_name && test.student == student}
            BoatingTest.all.find {|test|
                test.student == student
            }.status = "passed"
        else
            BoatingTest.new(student, test_name, self, "passed")
        end
    end

    def fail_student(student, test_name)
        # update test that has student to failed
        if BoatingTest.all.any? {|test| test.test_name == test_name && test.student == student}
            BoatingTest.all.find {|test| test.student == student}.status = "failed"
        else
            BoatingTest.new(student, test_name, self, "failed")
        end
    end
end