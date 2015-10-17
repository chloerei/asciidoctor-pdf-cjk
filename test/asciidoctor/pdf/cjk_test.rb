require 'test_helper'

class Asciidoctor::Pdf::CjkTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Asciidoctor::Pdf::Cjk::VERSION
  end

  def test_break_words_chinese
    zwsp = Prawn::Text::ZWSP
    assert_equal "测#{zwsp}试", Asciidoctor::Pdf::Cjk.break_words("测试")
    assert_equal "测#{zwsp}试#{zwsp}（括#{zwsp}号）", Asciidoctor::Pdf::Cjk.break_words("测试（括号）")
    assert_equal "测#{zwsp}试#{zwsp}“引#{zwsp}号”", Asciidoctor::Pdf::Cjk.break_words("测试“引号”")
    assert_equal "逗#{zwsp}号，#{zwsp}句#{zwsp}号。", Asciidoctor::Pdf::Cjk.break_words("逗号，句号。")
  end
end
