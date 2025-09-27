# frozen_string_literal: true

module Itacomp
  class TabComponentPreview < ViewComponent::Preview
    def default
      render(TabComponent.new(entries: "entries"))
    end
  end
end
