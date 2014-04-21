TodoListBankfacil::Application.routes.draw do
  root to: "tasks#index"
  put "/tasks/toggle", to: "tasks#toggle", as: "toggle_task_status"
  get  "/tasks", to: "tasks#index"
  post "/tasks/new", to: "tasks#create", as: "new_task"
  get  "/tasks/:id", to: "tasks#edit", as: "edit_task"
  put  "/tasks/:id", to: "tasks#update"
  get  "/tasks/:id/remove", to: "tasks#remove", as: "remove_task"
  delete "/tasks/:id/remove", to: "tasks#destroy"
end
