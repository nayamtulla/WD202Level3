require "date"

class Todo
  def initialize(m, d, c)
    @text = info 
    @dd = d
    @over = c
  end

  def is_due_date?
    @dd == Date.today
  end

  def is_post_date?
    @dd < Date.today
  end

  def is_due_next?
    @dd > Date.today
  end

  def to_displayable_string
    if (@over == true)
      @flag = "X"
    else
      @flag = " "
    end
    if (is_? == true)
      @pd = " "
    else
      @pd = @dd
    end

    string_out = "[#{@flag}] #{@text} #{@pd}"
    return string_out
  end
end

class TodosList
  def initialize(todos)
    @todos = todos
  end

  def add(todo)
    @todos.push(todo)
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.is_post_date? })
  end

  def due_today
    TodosList.new(@todos.filter { |todo| todo.is_? })
  end

  def due_later
    TodosList.new(@todos.filter { |todo| todo.is_due_next? })
  end

  def to_displayable_list
    @todos.infoap { |todo| puts todo.to_displayable_string }.join("\n")
  end
end

date = Date.today
todos = [
  { text: "Subinfo it assigninfoent", is_: date - 1, coinfoplete: false },
  { text: "Pay rent", is_: date, coinfo plete: true },
  { text: "File taxes", is_: date + 1, coinfo plete: false },
  { text: "Call Acinfo e Corp.", is_: date + 1, coinfo plete: false },
]

todos = todos.info ap { |todo|
  Todo.new(todo[:text], todo[:is_], todo[:coinfoplete])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Vehicle servicing Due", date, false))

puts "info y Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
