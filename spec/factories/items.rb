FactoryBot.define do
 factory :item do
    association :user
    name {"test"}                 
    info {"test"}                 
    category_id {"1"}          
    sales_status_id {"1"}      
    shipping_fee_status_id {"1"}
    prefecture_id {"1"}        
    scheduled_delivery_id {"1"}
    price {"333"}
    after(:build) do |item|
    item.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end                  
  end
end
