module Itacomp
  module CommonHelper
    def visually_hidden(text=nil)
      tag.span text, class: "visually-hidden"
    end
  end
end
