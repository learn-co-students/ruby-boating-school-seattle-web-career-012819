class BoatingTest
    attr_accessor :student, :instructor, :test_name, :test_status
    @@all_tests = []

    def initialize(student, test_name, test_status, instructor)
        @student = student
        @test_name = test_name
        @test_status = test_status
        @instructor = instructor
        @@all_tests << self
    end

    def self.all
        @@all_tests
    end

end #of class
