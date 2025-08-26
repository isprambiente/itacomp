module Itacomp
  # Common helper for itacomp component
  # To add these helerp in your rails projec add <tt>include Itacomp::CommonHelper</tt> in yout <tt>ApplicationHelper</tt>
  module CommonHelper
    # return an html span tag with class <tt>visually-hidden</tt> and an optional text
    #
    # ==== Options
    # * <tt>content</tt> [String] default <tt>nil</tt>
    #
    # ==== Example
    # Without options
    #   ita_visually_hidden
    #   # => <span class="visually-hidden"></span>
    # With text
    #   ita_visually_hidden('text')
    #   # => <span class="visually-hidden">text</span>
    def ita_visually_hidden(content = nil)
      tag.span content, class: "visually-hidden"
    end

    # Return html structure for an {icon}[https://italia.github.io/bootstrap-italia/docs/utilities/icone/] 
    #
    # ==== Options
    # * <tt>icon</tt> [String] no default (required), icon svg id
    # * <tt>:sprites</tt> [String] default <tt>'itacomp/sprites.svg'<.tt>, sprites asset path, default is sprites shared from Itacomp
    # * <tt>class</tt> [String,Array] default <tt>nil</tt> if present is added ad tag class after <tt>icon</tt>
    # * <tt>**opts</tt> each key is delegated as tag options
    #
    # ==== Examples
    # Simple icon
    #   icon('test')
    #   # => "<svg class="icon"><use href="/itacomp/sprites.svg#test" xlink:href="/itacomp/sprites.svg#test" /></svg>"
    #
    # With additional <tt>class</tt> and <tt>id</tt>
    #   icon('test', class: 'align-bottom', id: 'ok')
    #   # => "<svg class="icon align-bottom" id="ok""><use href="/itacomp/sprites.svg#test" xlink:href="/itacomp/sprites.svg#test" /></svg>"
    def ita_icon(icon, sprites: "itacomp/sprites.svg", **opts)
      url = asset_path("#{sprites}##{icon}")
      opts[:class] = ['icon', opts[:class]]
      tag.svg tag.use(href: url, "xlink:href": url),  **opts
    end

    # return html for a {spinner component}[https://italia.github.io/bootstrap-italia/docs/componenti/progress-indicators/#spinner]
    #
    # ==== Options
    #
    # * <tt>content</tt> [String] default <tt>nil</tt>, text content in visually hidden tag
    # * <tt>:active</tt> [Boolean] default <tt>true</tt>, if true add <tt>progress-spinner-active</tt> class
    # * <tt>:double</tt> [Boolean] default <tt>false</tt>, if active add <tt>progress-spinner-double</tt> class 
    # * <tt>:class</tt> [String,Array] default <tt>nil</tt>, if present is added as tag class after <tt>progress-spinner</tt>
    # * <tt>**opts</tt> each key is delegated as tag options
    #
    # ==== example
    # Without options (default active)
    #   ita_spinner()
    #   # => <div class="progress-spinner progress-spinner-active"><span class="visually-hidden"></span></div>
    # Inactive spinner
    #   ita_spinner(active: false)
    #   # => <div class="progress-spinner"><span class="visually-hidden"></span></div>
    # With text in span.visually-hidden tag
    #   ita_spinner('Loading')
    #   # => <div class="progress-spinner progress-spinner-active"><span class="visually-hidden">Loading</span></div>
    # Double With text in span.visually-hidden tag
    #   ita_spinner('Loading', double: true)
    #   # => <div class="progress-spinner progress-spinner-active progress-spinner-double"><span class="visually-hidden">Loading</span></div>
    # With additional class and text in span.visually-hidden tag
    #   ita_spinner('Loading', class: 'size-xl')
    #   # => <div class="progress-spinner progress-spinner-active size-xl"><span class="visually-hidden">Loading</span></div>
    # With additional class, id attribute, data attribute abd text in span.visually-hidden tag 
    #   ita_spinner('Loading', class: 'size-xl', id: 'my-spinner', data-load: 'my-loader')
    #   # => <div id="my-spinner" class="progress-spinner progress-spinner-active size-xl" data-load="my-loader"><span class="visually-hidden">Loading</span></div>
    def ita_spinner(content = nil, active: true, double: false, **opts)
      opts[:class] = ['progress-spinner', opts[:class]]
      opts[:class] << 'progress-spinner-double' if double
      opts[:class] << "progress-spinner-active" if active
      tag.div ita_visually_hidden(content), **opts
    end
  end
end
