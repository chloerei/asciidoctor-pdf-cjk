module Asciidoctor
  module Pdf
    class Converter
      def typeset_text_with_break_word(string, line_metrics, opts = {})
        typeset_text_without_break_word string.gsub(/[\p{Han}\p{Hiragana}\p{Katakana}]/) {|s| "#{s}#{::Prawn::Text::ZWSP}"}, line_metrics, opts
      end
      alias_method :typeset_text_without_break_word, :typeset_text
      alias_method :typeset_text, :typeset_text_with_break_word
    end
  end
end
