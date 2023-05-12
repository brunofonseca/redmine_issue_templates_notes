module IssueTemplatesNotesHelper
  def preview_link(url, form, target='preview', options={})
    content_tag 'a', l(:label_preview), {
        :href => "#",
        :onclick => %|submitPreview("#{escape_javascript url_for(url)}", "#{escape_javascript form}", "#{escape_javascript target}"); return false;|,
        :accesskey => accesskey(:preview)
      }.merge(options)
  end  
end
