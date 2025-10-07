# frozen_string_literal: true

module Itacomp
  # Common method and incluion for Itacomp components
  #
  # ==== Inclusion
  # * include ApplicationHelper
  # * include CommonHelper
  class ApplicationComponent < ViewComponent::Base
    include ApplicationHelper
    include CommonHelper

    # retur value if key is true
    # 
    # ==== Options
    # <tt>Value</tt> [Any], mandatory, return value if <TT>key</TT> is true
    # <tt>Key</tt> [Boolean], if true, return <tt>value</tt>
    def if_key(value, key)
      return value if key == true
    end
  end
end
