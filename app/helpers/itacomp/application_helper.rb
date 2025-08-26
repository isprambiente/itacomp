module Itacomp
  module ApplicationHelper
    ITA_TYPES = Hash.new { :primary }.with_indifferent_access.merge(primary: "primary", info: "info", success: "success", warning: "warning", danger: "danger")
  end
end
