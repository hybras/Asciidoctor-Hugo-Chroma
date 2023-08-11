# frozen_string_literal: true

require_relative "asciidoctor_hugo_chroma/version"
require "asciidoctor"
require "asciidoctor/extensions"

# The syntax highlighter. We omit the hugo highlighting shortcode with the source code embedded.
class HugoChromaSyntaxHighlighter < Asciidoctor::SyntaxHighlighter::Base
  include Asciidoctor::Logging
  register_for "hugo-chroma"

  def initialize *args
    super(*args)
  end

  def highlight?
    # check parent process is hugo
    true
  end

  def docinfo?(_location)
    false
  end

  def format(node, _lang, _opts)
    node.content
  end

  def highlight(_node, source, lang, _opts)
    # TODO: Linenumbers, highlighting, starting line number
    <<~EOS
      {{< highlight #{lang} >}}
      #{source}
      {{< /highlight >}}
    EOS
  end
end
