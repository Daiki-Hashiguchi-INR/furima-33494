FactoryBot.define do
  factory :item do
    association :user
    association :category
    association :condition
    association :post_type
    association :prefecture
    association :preparation_day

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name          {'こんにちは名前です'}
    explain       {'これめっちゃいいよね'}
    category_id   {2}
    condition_id     {2}
    post_type_id    {2}
    prefecture_id  {2}
    preparation_day_id {2}
    price        {7777}
  end
end