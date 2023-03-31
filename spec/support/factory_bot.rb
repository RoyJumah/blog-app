FactoryBot.define do
  factory :post do
    # attributes for the post factory
    title { 'My awesome post' }
    body { 'This is the content of my post' }
    user # association with the user factory
  end
end
