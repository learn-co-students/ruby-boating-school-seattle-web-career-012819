class Student
    attr_accessor :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name

        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, instructor, status)
    end

    def self.find_student(first_name)
        @@all.find {|students| students.first_name == first_name}
    end

    def all_tests
        BoatingTest.all.select {|test|
            test.student == self
        }
    end

    def grade_percentage
        number_tests_taken = all_tests.select {|test| test.status != "pending"}.length

        number_passed = all_tests.select {|test| test.status == "passed"}.length

        percentage = number_passed.to_f / number_tests_taken.to_f * 100
    end
end