require 'faker'
require 'factory_bot_rails'

module UserHelpers

  def login(user)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    request.session[:user] = user.id
  end

  def create_user
    FactoryBot.create(:user, 
            email: Faker::Internet.email, 
            password: Faker::Internet.password
        )
  end

  def build_user
    FactoryBot.build(:user, 
            email: Faker::Internet.email, 
            password: Faker::Internet.password
        )
  end

end
