module ApplicationHelper
  
  def create_button(options={})
    content_tag('div', submit_tag(t(:button_create),options) , :style=>"float:left")
  end  
  
  def cancel_button(options={})
    options = {:type => 'button', :onClick=>"parent.location='" + url_for(:action=>'index')+"'"} if !options.any?
    content_tag('div', submit_tag(t(:button_cancel),options) , :style=>"float:left")
  end  
  
end
