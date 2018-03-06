Next45MarsRoverAssessment::Application.routes.draw do
  root to: "rover_platos#new"
  resources :rover_platos do
    resources :rovers
  end
end
