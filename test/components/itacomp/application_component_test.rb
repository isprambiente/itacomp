# frozen_string_literal: true

require "test_helper"

class Itacomp::ApplicationComponentTest < ViewComponent::TestCase
  test 'if_key method' do
    assert_equal 'yes', Itacomp::ApplicationComponent.new.if_key('yes', true)
    assert_nil Itacomp::ApplicationComponent.new.if_key('yes', false)
    assert_nil Itacomp::ApplicationComponent.new.if_key('yes', 'test')
    assert_nil Itacomp::ApplicationComponent.new.if_key('yes', nil)
  end
end
