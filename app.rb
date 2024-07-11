require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:rules)
end

get("/rock") do
  @choice = choose
  @result = winner("rock", @choice)
  erb(:rock)
end

get("/paper") do
  @choice = choose
  @result = winner("paper", @choice)
  erb(:paper)
end

get("/scissors") do
  @choice = choose
  @result = winner("scissors", @choice)
  erb(:scissors)
end

def choose
  choices = ["rock", "paper", "scissors"]
  return choices.sample
end

def winner(player_choice, computer_choice)
  case player_choice
  when "rock"
    if computer_choice == "rock"
      return "tied"
    elsif computer_choice == "paper"
      return "lost"
    else
      return "won"
    end
  when "paper"
    if computer_choice == "paper"
      return "tied"
    elsif computer_choice == "scissors"
      return "lost"
    else
      return "won"
    end
  when "scissors"
    if computer_choice == "scissors"
      return "tied"
    elsif computer_choice == "rock"
      return "lost"
    else
      return "won"
    end
  end
end
