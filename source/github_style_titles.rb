require 'middleman-core/renderers/redcarpet'
require 'rexml/document'
module Middleman
  module Renderers
    class MiddlemanRedcarpetHTML 
      def header(title, level)
        @headers ||= []

        title_elements = REXML::Document.new(title)
        flattened_title = title_elements.inject('') do |flattened, element|
          flattened +=  if element.respond_to?(:text)
                          element.text
                        else
                          element.to_s
                        end
        end
        permalink = flattened_title.downcase.gsub(/[^a-z\s]/, '').gsub(/\W+/, "-")

        # for extra credit: implement this as its own method
        if @headers.include?(permalink)
          permalink += "_1"
          # my brain hurts
          loop do
            break if !@headers.include?(permalink)
            # generate titles like foo-bar_1, foo-bar_2
            permalink.gsub!(/\_(\d+)$/, "_#{$1.to_i + 1}")
          end
        end
        @headers << permalink
        %(\n<h#{level}><a id="#{permalink}" class="anchor"></a>#{title}</h#{level}>\n)

        #%(\n<h#{level} id='#{permalink}'>#{title}</h#{level}>\n)
      end
    end
  end
end
