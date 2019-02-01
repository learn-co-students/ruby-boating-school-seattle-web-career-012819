class Student

        attr_reader :first_name

        @@all_kids = []

        def initialize(first_name)
                @first_name = first_name
                @@all_kids << self
        end

        def self.all
                @@all_kids
        end

        def add_boating_test(test_name, test_status, instructor)
                BoatingTest.new(self, test_name, test_status, instructor)
        end

        def self.find_student(first_name)
           @@all_kids.select do |student|
                        student.first_name == first_name
          end
        end

        def grade_percentage
                count = 0
                passed = 0
             BoatingTest.all.each do |test|
                if test.student == self
                        if test.test_status 
                                count += 1
                                if test.test_status == "passed"
                                        passed += 1
                                else end
                        else end
                else end
             end
              "%#{(passed/count.to_f * 100).round(2)}"
        end
             
end #of class
