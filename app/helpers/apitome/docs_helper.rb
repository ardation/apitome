module Apitome::DocsHelper
  def format_scope(scope)
    Array(scope).each_with_index.map do |value, index|
      if index == 0
        value
      else
        "[#{value}]"
      end
    end.join
  end
end
