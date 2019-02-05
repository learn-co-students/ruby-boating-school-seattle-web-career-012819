require 'pry'

class Instructor
    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def tests
        BoatingTest.all.select do |test|
            test.instructor == self
        end
    end

    def students
        self.tests.map do |test|
            test.instructor
        end
    end

    def pass_student(student, name_of_test)
        self.tests.each do |test|
            if test.student == student && test.test_name == name_of_test
                test.test_status == 'passed'
            else
                BoatingTest.new(self, student, name_of_test, status = 'passed')
            end
        end
    end

    def fail_student(student, name_of_test)
        self.tests.each do |test|
            if test.student == student && test.test_name == name_of_test
                test.test_status == 'failed'
            else
                BoatingTest.new(self, student, name_of_test, status = 'failed')
            end
        end
    end


    def self.all
        @@all
    end
end