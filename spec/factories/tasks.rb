FactoryBot.define do
  factory :task do
    name { 'test task' }
    description{ 'prepare tasks using RSpec & Capybara & FactoryBot' }
    user
  end
end
