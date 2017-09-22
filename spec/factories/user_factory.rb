FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }      # I dont have to come up with another email address

  factory :user do
    email     # bcs of sequence
    password "1234567890"
    first_name "Adam1"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email    # bcs of sequence
    password "qwertyuiop"
    admin true
    first_name "Admin"
    last_name "User"
  end

end
