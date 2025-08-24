module Itacomp
  module CommonHelper
    # @example
    #   ita_visually_hidden -> `<span class="visually-hidden"></span>`
    #   ita_visually_hidden('text') -> `<span class="visually-hidden">text</span>`
    #
    # @param [String] content Optiona html/string content
    #
    # @return [String] html span tag with class `visually-hidden` and optional content
    def ita_visually_hidden(content = nil)
      tag.span content, class: "visually-hidden"
    end
  end
end
