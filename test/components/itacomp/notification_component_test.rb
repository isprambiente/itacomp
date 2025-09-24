# frozen_string_literal: true

require "test_helper"

class Itacomp::NotificationComponentTest < ViewComponent::TestCase
  test "only required title" do
    render_inline Itacomp::NotificationComponent.new(title: 'test')
    assert_selector "div.notification.dismissable.show[role='alert']", text: 'test'
    assert_selector "div.notification.dismissable.show h2.h5", text: 'test'
    assert_selector "div.notification.dismissable.show button.btn.notification-close svg.icon"
    assert_selector "div.notification.dismissable.show button.btn.notification-close span.visually-hidden", text: 'close notification: test'
  end

  test "with id can be set ids and aria-labelledid" do
    render_inline Itacomp::NotificationComponent.new(title: 'test', id: 'test')
    assert_selector "div.notification.dismissable.show#test[aria-labelledby='test-title'] h2.h5#test-title", text: 'test'
  end

  test "can render with icon" do
    render_inline Itacomp::NotificationComponent.new(title: 'test', icon: 'test')
    assert_selector "div.notification.dismissable.show.with-icon h2.h5 svg.icon"
  end
end
