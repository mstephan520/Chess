require_relative 'employee'

class Manager < Employee
    def initialize(name, position, salary, subordinates)
        @subs = subordinates
        super(name, position, salary)
    end

    def bonus(multiplier)
        total_salary * multiplier
    end

    def total_salary
        total = 0

        @subs.each do |sub|
            if sub.is_a?(Manager)
                total += sub.salary + sub.total_salary
            else
                total += sub.salary
            end
        end

        return total
    end

end

david = Employee.new('David', 'TA', 10000)
shawna = Employee.new('Shawna', 'TA', 12000)
darren = Manager.new('Darren', 'TA Manager', 78000, [david, shawna])
ned = Manager.new('Ned', 'Founder', 1000000, [darren])

p ned.salary
p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)

