# frozen_string_literal: true

module Itacomp
  class NotificationComponentPreview < ViewComponent::Preview
    def default
      render(NotificationComponent.new(title: 'text'))
    end
  end
end
