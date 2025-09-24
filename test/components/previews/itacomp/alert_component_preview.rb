# frozen_string_literal: true

module Itacomp
  class AlertComponentPreview < ViewComponent::Preview
    def default
      render(AlertComponent.new(type: "primary", close: true))
    end
  end
end
