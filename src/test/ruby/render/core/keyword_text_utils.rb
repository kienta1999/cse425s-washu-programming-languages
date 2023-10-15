class KeywordTextUtils
  def self.keyword_text(keyword, value)
    if value.nil?
      ""
    else
      "#{keyword}: #{value},"
    end
  end
end