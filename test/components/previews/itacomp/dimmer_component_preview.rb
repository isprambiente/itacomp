# frozen_string_literal: true

module Itacomp
  class DimmerComponentPreview < ViewComponent::Preview
    def default
      render(DimmerComponent.new(open: "open"))
    end
  end
end
