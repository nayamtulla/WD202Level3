require "date"

class Todo
  def initialize(m, d, c)
    @text = m
    @dd = d
    @over = c
  end

  def is_due_today?
    @dd == Date.today
  end

  def is_overdue?
    @dd < Date.today
  end

  def is_due_later?
    @dd > Date.today
  end

  def to_displayable_string
    if (@over == true)
      @flag = "X"
    else
      @flag = " "
    end
    if (is_due_today? == true)
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
    TodosList.new(@todos.filter { |todo| todo.is_overdue? })
  end

  def due_today
    TodosList.new(@todos.filter { |todo| todo.is_due_today? })
  end

  def due_later
    TodosList.new(@todos.filter { |todo| todo.is_due_later? })
  end

  def to_displayable_list
    @todos.map { |todo| puts todo.to_displayable_string }.join("\n")
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, complete: false },
  { text: "Pay rent", due_date: date, complete: true },
  { text: "File taxes", due_date: date + 1, complete: false },
  { text: "Call Acme Corp.", due_date: date + 1, complete: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:complete])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Mobile Servicing", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
