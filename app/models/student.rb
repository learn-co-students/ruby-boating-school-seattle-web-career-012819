class Student
    @@all = []
    attr_reader :first_name

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(name)
        self.all.find do |student|
            student.first_name == name
        end
    end

    def tests
        BoatingTest.all.select do |test|
            test.student == self
        end
    end

    def grade_percentage
        passed_tests = 0
        failed_tests = 0
        self.tests.each do |test|
            if test.test_status == 'passed'
                passed_tests += 1
            elsif test.test_status == 'failed'
                failed_tests += 1
            end
        end
        (passed_tests.to_f / (passed_tests + failed_tests)).round(2)
    end

    def self.all
        @@all
    end
end