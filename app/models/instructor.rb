require 'pry'

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

    def pass_student(student, test_name)
        BoatingTest.all.find do |test|
            if test.test_name == test_name && test.student == student
                test.test_status = 'passed'
                return test
            end
        end
        BoatingTest.new(student, name, 'passed', self)
    end

    def fail_student(student, test_name)
        BoatingTest.all.each do |test|
            if test.test_name == test_name && test.student == student
                test.test_status = 'failed'
                return test
            end
        end
        BoatingTest.new(student, name, 'failed', self)
    end

end
