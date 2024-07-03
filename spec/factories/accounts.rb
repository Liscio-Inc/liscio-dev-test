FactoryBot.define do
  factory :account do
    name  { "Weyland Yutani" }
    address { "1 Gateway Station, Earth"}
    company_type { "accounting firm" }

    trait :bookkeeper do
      company_type { "bookkeeper" }
    end
  end
end
