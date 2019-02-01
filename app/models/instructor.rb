class Instructor

    attr_reader :name
@@all_teach = []
    def initialize(name)
        @name = name
        @@all_teach << self
    end

    def self.all
        @@all_teach
    end

    def pass_student(student, test_name)
        BoatingTest.all.each do |boatt|
            if boatt.student == student && boatt.test_name == test_name
                boatt.test_status = "passed"
                return boatt
            else 
              return BoatingTest.new(student, test_name, "passed", self)
            end
        end
    end

    def fail_student(student, test)
        BoatingTest.all.each do |boatt|
            if boatt.student == student && boatt.test_name == test
                boatt.test_status = "failed"
                return boatt
            else 
            return BoatingTest.new(student, test, "failed", self)
            end
        end
    end

end #of class
