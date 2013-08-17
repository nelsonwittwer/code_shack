require 'source/github_style_titles.rb'
###
#
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
with_layout :rspec_guide do
  page "/guides/rspec/*"
end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  #auto updating when viewing source with middleman server
  activate :livereload
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# Markdown Config
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :disable_indented_code_blocks => true,
               :smartypants => true,
               :layout_engine => :erb,
               :tables => true,
               :autolink => true,
               :smartypants => true,
               :no_intra_emphasis => true,
               :with_toc_data => true


activate :syntax, lineanchors: 'line'
