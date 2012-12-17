# coding: utf-8
describe Message do
  subject(:message) { Message.new }

  before do
    message.name = Faker::Name.name
    message.email = Faker::Internet.email
    message.body = Faker::Lorem.words
  end
  context "Validations" do
    it { should ensure_length_of(:name).is_at_least(3) }
    it { should ensure_length_of(:email).is_at_least(3) }
    it { should ensure_length_of(:body).is_at_least(3) }
    it "Should validate email format" do
      should be_valid
      message.email = "joao1083"
      should_not be_valid
      message.email = "joao@1083"
      should_not be_valid
      message.email = "@joao1083"
      should_not be_valid
      message.email = "aron@joao1083.c"
      should_not be_valid
    end
  end
end