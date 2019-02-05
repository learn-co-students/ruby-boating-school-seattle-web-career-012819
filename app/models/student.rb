# Student class:

# should initialize with first_name
# Student.all should return all of the student instances
# Student#add_boating_test should initialize a new boating test with a Student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object)
# Student.find_student will take in a first name and output the student (Object) with that name
# Student#grade_percentage should return the percentage of 
#tests that the student has passed, a Float 
#(so if a student has passed 3 / 9 tests that they've taken, 
#this method should return the Float 33.33)
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

    def add_boating_test(test_status, test_name, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(first_name)
        @@all.find do |student|
         student.first_name
        end
    end

    def test
        BoatingTest.all.select do |t|
           t.student == self
        end
    end

    def grade_percentage
        passed_tests = 0
        all_tests = 0
            self.test.each do |test|
                binding.pry
                if test.test_status == 'passed'
                    
                    passed_tests += 1
                    all_tests += 1
                else
                    all_tests += 1
            end
            return (passed_tests.to_f / all_tests) * 100
        end

    end

end #end of class
