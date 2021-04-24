void main(){
  var todolist = new TodoList();

  todolist.addNewTodo("Feed the pet", false, DateTime(2078,02,05));
  todolist.addNewTodo("Watch Money Heist",true, DateTime(2078,03,07));
  todolist.addNewTodo("Complete the novel",false, DateTime(2078,03,010));
  // todolist.addNewTodo("Feed the pet", false, DateTime(2078,02,20));

  todolist.printTodos();

  var completedList =todolist.getCompletedTodos();
  print("\n$completedList");
  var inCompletedList=todolist.getInCompletedTodos();
  print("\n$inCompletedList");

  todolist.updateTodoByName("Feed the pet", "Play basketball");
  todolist.printTodos();
  // todolist.updateTodoByIndex("Feed the pet");
}

class TodoList{

    List<Todo> todos= [];

    void addNewTodo(String title, bool isCompleted, DateTime date){
      var newTodo = new Todo(title, isCompleted, date);
      todos.add(newTodo);
    }

    void printTodos(){
      print(todos);
    }

    List<Todo> getCompletedTodos(){
      return todos.where((singleTodo) => singleTodo.isCompleted).toList();
    }
    List<Todo> getInCompletedTodos(){
      return todos.where((singleTodo) => singleTodo.isCompleted==false).toList();
    }

    void updateTodoByName(String title, String newTitle){
     var item = todos.firstWhere((singleTodo) => singleTodo.title == title);
     item.title = newTitle; 
    }

    // void updateTodoByIndex(String title){
    //  var itemindex = todos.indexWhere((singleTodo) => singleTodo.title == title);
    //  todos[itemindex].isCompleted =true;
    //  todos[itemindex].date = DateTime.now();
    // }
    
}

class Todo{
  String title;
  bool isCompleted;
  DateTime date;

  Todo(this.title, this.isCompleted, this.date);

  @override
  String toString(){
    String val = isCompleted? "completed": "not Completed";
    return "$title is currently $val and it is expected to be completed by $date";
  }
}
