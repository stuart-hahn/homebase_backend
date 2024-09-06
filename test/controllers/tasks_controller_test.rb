require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # Test the index action (GET /tasks)
  test "should get index" do
    get tasks_url
    assert_response :success
  end

  # Test the show action (GET /tasks/:id)
  test "should show task" do
    task = tasks(:one) # Assuming you have a fixture for Task
    get task_url(task)
    assert_response :success
  end

  # Test the create action (POST /tasks)
  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { title: 'New Task' } }
    end
    assert_response :created
  end

  # Test the update action (PATCH/PUT /tasks/:id)
  test "should update task" do
    task = tasks(:one)
    patch task_url(task), params: { task: { title: 'Updated Task' } }
    assert_response :success
  end

  # Test the destroy action (DELETE /tasks/:id)
  test "should destroy task" do
    task = tasks(:one)
    assert_difference('Task.count', -1) do
      delete task_url(task)
    end
    assert_response :no_content
  end

  test "should create task with status" do
    post tasks_url, params: { task: { title: 'New Task', status: 'to_do' } }
    assert_response :created
  end
  
  test "should update task status" do
    task = tasks(:one)
    patch task_url(task), params: { task: { status: 'done' } }
    assert_response :success
  end  

  test "should create task with due date" do
    post tasks_url, params: { task: { title: 'New Task', status: 'to_do', due_date: '2024-12-31' } }
    assert_response :created
  end
  
  test "should update task due date" do
    task = tasks(:one)
    patch task_url(task), params: { task: { due_date: '2024-12-31' } }
    assert_response :success
  end  

  test "should create task with priority" do
    post tasks_url, params: { task: { title: 'New Task', status: 'to_do', priority: 'medium' } }
    assert_response :created
  end
  
  test "should update task priority" do
    task = tasks(:one)
    patch task_url(task), params: { task: { priority: 'high' } }
    assert_response :success
  end  
end
