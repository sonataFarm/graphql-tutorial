require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, {})
  end

  test 'creating new user' do
    user = perform(
      name: 'Test',
      authProvider: {
        login_info: {
          email: 'test@test.com',
          password: '123456'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'Test User'
    assert_equal user.email, 'test@test.com'
  end
