FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { password }
    last_name             { '松本' }
    first_name            { '潤' }
    last_kana_name        { 'マツモト' }
    first_kana_name       { 'ジュン' }
    birthday              { '1955-02-01' }
  end
end
