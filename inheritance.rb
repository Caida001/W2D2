class Employee
  attr_accessor :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  def initialize(name, title, salary, boss, subordinates)
    super(name, title, salary, boss)
    #super
    @subordinates = subordinates
  end

  def bonus(multiplier)
    subordinates_salary = @subordinates.inject(0) do |subs_salary, subordinate|
      if subordinate.is_a?(Manager)
        subs_salary + subordinate.salary + subordinate.bonus(1)
      else
        subs_salary + subordinate.salary
      end
    end
    subordinates_salary * multiplier
  end
end
