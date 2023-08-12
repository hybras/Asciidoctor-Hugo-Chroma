require "minitest/autorun"
require "minitest/test"
require "asciidoctor"
require "asciidoctor-hugo-chroma"

class HugoHighlighterTest < Minitest::Test
  def test_highlighter
    adoc = File.join(File.expand_path(File.dirname(__FILE__)), 'test-fixture', 'content', 'index.adoc')
    out = Asciidoctor.convert_file adoc, 
      safe: :safe,
      standalone: false,
      to_file: false
    contains = <<~EOS
    {{< highlight ruby >}}
    puts "chroma plugin"

    class RubyClass
    end
    {{< /highlight >}}
    EOS
    assert_match(contains, out)
  end
end