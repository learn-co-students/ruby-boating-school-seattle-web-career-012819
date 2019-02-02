require 'pry'

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

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(name)
        BoatingTest.all.find {|student| student.first_name == name }
    end

    def find_test
        BoatingTest.all.select do |test| 
            test.student == self
        end
    end

    def grade_percentage
        passed = 0
        total_tests = 0
        find_test.each do |test| 
            total_tests += 1
            if test.test_status == 'passed' 
                passed += 1
            end
        end
        return (passed.to_f/total_tests).round(2)
    end
end
