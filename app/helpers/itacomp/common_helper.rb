module Itacomp
  # Common helper for itacomp component
  # To add these helerp in your rails projec add `include Itacomp::CommonHelper` in yout `ApplicationHelper`
  module CommonHelper
    # @example ita_visually_hidden
    #  <span class="visually-hidden"></span>
    #
    # @example ita_visually_hidden('text')
    #   <span class="visually-hidden">text</span>
    #
    # @param [String] content Optiona html/string content
    #
    # @return [String] html span tag with class `visually-hidden` and optional content
    def ita_visually_hidden(content = nil)
      tag.span content, class: "visually-hidden"
    end

    # @example icon('test')
    #  "<svg class="icon"><use href="/itacomp/sprites.svg#test" xlink:href="/itacomp/sprites.svg#test" /></svg>"
    #
    # @example icon('test', class: 'icon align-bottom', id: 'ok')
    #  "<svg class="icon align-bottom" id="ok""><use href="/itacomp/sprites.svg#test" xlink:href="/itacomp/sprites.svg#test" /></svg>"
    #
    # @param [String] icon - icon id for sprites.svg
    # @param [String] :sprites sprites file path for asset_path, default 'itacomp/sprites.svg' from Itacomp asset
    # @param [String] :class SVG tag class, default 'icon'
    def ita_icon(icon, sprites: "itacomp/sprites.svg", class: "icon", **opts)
      url = asset_path("#{sprites}##{icon}")
      tag.svg tag.use(href: url, "xlink:href": url),  class:, **opts
    end
  end
end
