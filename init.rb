require 'redmine'
require 'redmine/syntax_highlighting'
require File.join(File.dirname(__FILE__),'lib/syntaxhighlighter.rb')

Redmine::Plugin.register :redmine_js_syntax_highlighter do
  name "Redmine JavaScript Syntax Highlighter plugin"
  author "Martin Minka, based on Jean-Baptiste Barth's work"
  description "Uses JavaScript SyntaxHighlighter to highlight files in the source code repository."
  version "0.0.2"
  
  # Create a dropdown list in the UI so the user can pick a theme.
  if UserCustomField.table_exists?
    unless UserCustomField.find_by_name(Redmine::SyntaxHighlighting::JsSyntaxHighlighter::SETTING_KEY_THEME)
      UserCustomField.create(
        :name             => Redmine::SyntaxHighlighting::JsSyntaxHighlighter::SETTING_KEY_THEME, 
        :default_value    => Redmine::SyntaxHighlighting::JsSyntaxHighlighter::DEFAULT_THEME,
        :possible_values  => Redmine::SyntaxHighlighting::JsSyntaxHighlighter::THEMES,
        :field_format     => 'list',
        :is_required      => true
      )
    end
  end
  
  # Create a dropdown list in the UI so the admin can pick a theme.
  #settings(:default => {
  #            'theme' => Redmine::SyntaxHighlighting::JsSyntaxHighlighter::DEFAULT_THEME,
  #            'possible_values' => Redmine::SyntaxHighlighting::JsSyntaxHighlighter::THEMES
  #           },
  #          :partial => 'jssyntaxhighlighter_settings/redmine_js_syntax_highlighter_settings')
  
  #requires_redmine :version_or_higher => '1.1.0' # tested with this version
end

# this will overrider the default highlighter
Redmine::SyntaxHighlighting.highlighter = Redmine::SyntaxHighlighting::JsSyntaxHighlighter