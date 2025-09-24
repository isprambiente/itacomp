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
    def ita_visually_hidden(text = nil)
      tag.span text, class: "visually-hidden"
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
      opts[:class] = [ "icon", opts[:class] ]
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
      opts[:class] = [ "progress-spinner", opts[:class] ]
      opts[:class] << "progress-spinner-double" if double
      opts[:class] << "progress-spinner-active" if active
      tag.div ita_visually_hidden(content), **opts
    end

    # return html for a [Donuts component](https://italia.github.io/bootstrap-italia/docs/componenti/progress-indicators/#donuts)
    #
    # ==== Options
    #
    # * <tt>value</tt> [Integer] default <tt>0</tt>, integer intended as a percentage, example 20 as 20%, 120 as 120%
    # * <tt>:class</tt> [String,Array] default <tt>nil</tt>, if present is added as tag class after <tt>progress-donut</tt>
    # * <tt>:data</tt> [Hash] default <tt>{}</tt>, if present is merged with standard donut data options
    # * <tt>**opts</tt> [Hash] default <tt>{}</tt>, each other named params is delegated to .progress-donut div.
    #
    # ==== Examples
    # Without options (default 0%)
    #   ita_donut()
    #   # => <div class=\"progress-donut-wrapper\"><div class=\"progress-donut\" data-bs-progress-donut=\"true\" data-bs-value=\"0.0\"></div><span class=\"visually-hidden\">0%</span></div>
    # with percentage
    #   ita_donut(50)
    #   # => <div class=\"progress-donut-wrapper\"><div class=\"progress-donut\" data-bs-progress-donut=\"true\" data-bs-value=\"0.5\"></div><span class=\"visually-hidden\">50%</span></div>
    # With other option
    #   ita_donut(50, id: 'my-donut', data: {test: tost})
    #   # => <div class=\"progress-donut-wrapper\"><div id="my-donut" class=\"progress-donut\" data-bs-progress-donut=\"true\" data-bs-value=\"0.5\" data-test=\"tost\"></div><span class=\"visually-hidden\">50%</span></div>
    def ita_donut(value = 0, **opts)
      opts[:class] = [ "progress-donut", opts[:class] ]
      opts[:data] = { bs_progress_donut: true, bs_value: value.to_i / 100.0 }.merge opts[:data].to_h
      tag.div safe_join([ tag.div(**opts), ita_visually_hidden("#{value}%") ]), class: "progress-donut-wrapper"
    end

    # Return HTML for a [Progress component](https://italia.github.io/bootstrap-italia/docs/componenti/progress-indicators/#progress-bar)
    #
    # ==== Options
    # * <tt>value</tt> [Integer] default <tt>nil</tt>, integer intended as a percentage, if present is percentage of prograss bar, if nil progress bar is set as indeterminate
    # * <tt>:type</tt> [Sym,String] default <tt>nil</tt>, if present set color of progress bar from the bootstrap-italia type (primary, info, success, warning, alert)
    #
    # ==== Examples
    # Without options
    #   ita_progress
    #   # => <div class="progress progress-indeterminate"><div class="progress-bar" role="progressbar"></div></div>
    # With value
    #   ita_progress(50)
    #   # => <div class="progress"><div class="progress-bar" role="progressbar" style="width: 50%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="50"></div></div>
    # With value and color type
    #   ita_progress(50, type: primary)
    #   # => <div class="progress progress-color"><div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="50"></div></div>
    def ita_progress(value = nil, type: nil)
      progress_class = [ "progress" ]
      opts = { class: [ "progress-bar" ], role: "progressbar" }
      if value.present?
        opts[:style] = "width: #{value}%"
        opts[:aria] = { valuemin: 0, valuemax: 100, valuenow: value }
      else
        progress_class << "progress-indeterminate"
      end
      if type.present?
        progress_class << "progress-color"
        opts[:class] << "bg-#{ITA_TYPES[type]}"
      end
      tag.div tag.div(**opts), class: progress_class
    end

    # return a span.badge tag with an optional span.visually-hidden tag
    #
    # ==== Options
    # * <tt>value</tt> [String], default <tt>nil</tt>, mandatory.badge content
    # * <tt>msg</tt> [String], default <tt>nil</tt>, optional visually-hidden span message for accessibility
    # * <tt>:class</tt> [String,Array] default <tt>nil</tt>, if present is added as tag class after <tt>badge</tt>
    # * <tt>**opts</tt> [Hash] default <tt>{}</tt>, each other named params is delegated to span.badge tag.  
    def ita_badge(value, msg = nil, **opts)
      opts[:class] = ['badge', opts[:class]]
      hidden = msg.present? ? ita_visually_hidden(msg) : nil
      return safe_join([tag.span(value, **opts), hidden])
    end

    # return size class from bootstrap-italia size types.
    #
    # ==== Options
    # * <tt>type</tt> [String] default <tt>nil</tt>, if nin or a value not included in ITA_SIZES is set as <tt>:md</tt>
    #
    # ==== Example
    # Whitout params
    #   ita_size()
    #   # => "size-md"
    # with valid params (:xs, :sm, :md, :lg, :xl, :xxl)
    #   ita_size(:xs)
    #   # => "size-xs"
    # with invalid params
    #   ira_size(:other)
    #   # => "size-md"
    def ita_size(type = nil)
      "size-#{ITA_SIZES[type]}"
    end

    # return background class from bootstrap-italia color types.
    #
    # ==== Options
    # * <tt>type</tt> [String] default <tt>nil</tt>, if nin or a value not included in ITA_TYPES is set as <tt>:primary</tt>
    #
    # ==== Example
    # Whitout params
    #   ita_type()
    #   # => "bg-primary"
    # with valid params (:primary, :secondary, :success, :danger, :warning, :white, :dark, :black)
    #   ita_size(:secondary)
    #   # => "bg-secondary"
    # with invalid params
    #   ira_size(:other)
    #   # => "size-primary"
    def ita_bg(type = nil)
      "bg-#{ITA_TYPES[type]}"
    end

    # return text class from bootstrap-italia color types.
    #
    # ==== Options
    # * <tt>type</tt> [String] default <tt>nil</tt>, if nin or a value not included in ITA_TYPES is set as <tt>:primary</tt>
    #
    # ==== Example
    # Whitout params
    #   ita_text()
    #   # => "text-primary"
    # with valid params (:primary, :secondary, :success, :danger, :warning, :white, :dark, :black)
    #   ita_text(:secondary)
    #   # => "text-secondary"
    # with invalid params
    #   ira_text(:other)
    #   # => "text-primary"
    def ita_text(type = nil)
      "text-#{ITA_TYPES[type]}"
    end
  end
end
