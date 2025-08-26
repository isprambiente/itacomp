# frozen_string_literal: true

module Itacomp
  class AlertComponentPreview < ViewComponent::Preview
    def default
      render(AlertComponent.new(text: "text", type: "type", close: "close"))
    end
  end
end
