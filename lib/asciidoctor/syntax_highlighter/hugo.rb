# frozen_string_literal: true

require_relative "version"
require "asciidoctor"
require "asciidoctor/extensions"

module Asciidoctor
module SyntaxHighlighter
# The syntax highlighter. We omit the hugo highlighting shortcode with the source code embedded.
class HugoSyntaxHighlighter < Asciidoctor::SyntaxHighlighter::Base
  include Asciidoctor::Logging
  register_for "hugo"

  def initialize name, backend = 'html5', opts = {}
    super
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
    <<~SHORTCODE
      {{< highlight #{lang} >}}
      #{source}
      {{< /highlight >}}
    SHORTCODE
  end
end
end
end