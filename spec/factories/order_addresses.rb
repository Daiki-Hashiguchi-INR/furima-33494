FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }

    post_number { '222-2222' }
    prefecture_id { 2 }
    city { '山本市' }
    address { '天天1-2-3' }
    building { '日本ビル303' }
    phone_number { '08033337777' }
  end
end
