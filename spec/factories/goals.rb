FactoryBot.define do
  factory :goal do
    user_id 1
    title "MyString"
    details "MyText"
    private false
    completed false
  end
end
