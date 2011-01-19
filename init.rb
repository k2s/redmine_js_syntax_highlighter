require 'redmine'

Redmine::Plugin.register :redmine_js_syntax_highlighter do
  name "Redmine JavaScript Syntax Highlighter plugin"
  author "Martin Minka, based on Jean-Baptiste Barth's work"
  description "Uses JavaScript SyntaxHighlighter to highlight files in the source code repository."
  version "0.0.1"
  # Create a dropdown list in the UI so the admin can pick a theme.
  #settings(:default => {
  #            'theme' => Uv::DEFAULT_THEME,
  #            'possible_values' => Uv::THEMES
  #           },
  #          :partial => 'ultraviolet_settings/redmine_ultraviolet_settings')
  
  # requires_redmine :version_or_higher => '0.8.0'
end

# this will overrider the default highlighter
require 'redmine/syntax_highlighting'
require File.join(File.dirname(__FILE__),'lib/syntaxhighlighter.rb')
Redmine::SyntaxHighlighting.highlighter = Redmine::SyntaxHighlighting::JsSyntaxHighlighter