class BoatingTest
    attr_accessor :student, :test_name, :instructor, :status
    
    @@all= []
    
    def initialize(student, test_name, instructor, status)
      @student = student
      @test_name = test_name
      @instructor = instructor
      @status = status
      
      @@all << self
    end
    
    def self.all
      @@all
    end
    
end