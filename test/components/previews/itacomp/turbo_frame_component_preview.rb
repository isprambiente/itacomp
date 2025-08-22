# frozen_string_literal: true

module Itacomp
  class TurboFrameComponentPreview < ViewComponent::Preview
    def default
      render TurboFrameComponent.new(id: "text").with_content("text content")
    end

    def empty
      render TurboFrameComponent.new(id: "empty")
    end

    def remote
      render TurboFrameComponent.new(id: "remote", href: "http://itacomp.it")
    end

    def remote_with_content
      render TurboFrameComponent.new(id: "remote-with-content", href: "http://itacomp.it").with_content("text content")
    end
  end
end
