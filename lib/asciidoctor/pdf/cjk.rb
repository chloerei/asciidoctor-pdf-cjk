# encoding: utf-8

require "asciidoctor-pdf"
require "asciidoctor/pdf/cjk/version"
require "asciidoctor/pdf/cjk/converter"

module Asciidoctor
  module Pdf
    module Cjk
      def self.break_words(string)
        cjk_pattern = /(?<!^|\p{Space}|\p{Ps}|\p{Pi})[\p{Han}\p{Hiragana}\p{Katakana}\p{Ps}\p{Pi}]/
        
        # If there are some inline images in the content, leave the CJK characters in these <img ...> unbroken.
        # Just break the other CJK characters.
        image_pattern = /<img.*?>/
        if string.match(image_pattern) != nil
          img = string.scan(image_pattern)
          other = string.split(image_pattern, -1)
          
          ret = ""
          for i in 0 .. img.size - 1
            ret += other[i].gsub(cjk_pattern) {|s| "#{::Prawn::Text::ZWSP}#{s}"}
            ret += img[i]
          end
          ret += other[other.size - 1].gsub(cjk_pattern) {|s| "#{::Prawn::Text::ZWSP}#{s}"}
          
          return ret
        else
          return string.gsub(cjk_pattern) {|s| "#{::Prawn::Text::ZWSP}#{s}"}
        end
      end
    end
  end
end
