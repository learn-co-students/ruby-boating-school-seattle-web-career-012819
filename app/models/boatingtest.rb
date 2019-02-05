class BoatingTest
    @@all = []
    attr_reader :instructor, :student, :test_name, :test_status

    def initialize(instructor, student, test_name, test_status)
        @test_name = test_name
        @test_status = test_status
        @instructor = instructor
        @student = student
        @@all << self
    end
    
    def self.all
        @@all
    end
end