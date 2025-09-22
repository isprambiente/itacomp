# frozen_string_literal: true

module Itacomp
  class AvatarComponentPreview < ViewComponent::Preview
    def default
      render(AvatarComponent.new(content: "content", size: "l", bg: "primary", class: "class"))
    end
  end
end
