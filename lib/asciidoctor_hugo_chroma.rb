# frozen_string_literal: true

require_relative "asciidoctor_hugo_chroma/version"
require 'asciidoctor'
require 'asciidoctor/extensions'

class HugoChromaSyntaxHighlighter < Asciidoctor::SyntaxHighlighter::Base
  include Asciidoctor::Logging
  register_for 'hugo-chroma'

  def initialize *args
    super *args
  end

  def highlight?
    # check parent process is hugo
    return true
  end

  def docinfo? location
    false
  end

  def format node, lang, opts
    return node.content
  end

  def highlight node, source, lang, opts
    # TODO: Linenumbers, highlighting, starting line number
    return <<~EOS
        {{< highlight #{lang} >}}
        #{source}
        {{< /highlight >}}
    EOS
  end

end
