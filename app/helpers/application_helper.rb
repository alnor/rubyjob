module ApplicationHelper
  
  def create_button(options={})
    content_tag('div', submit_tag(t(:button_create),options) , :style=>"float:left")
  end  
  
  def cancel_button(options={})
    options = {:type => 'button', :onClick=>"parent.location='" + url_for(:action=>'index')+"'"} if !options.any?
    content_tag('div', submit_tag(t(:button_cancel),options) , :style=>"float:left;margin-right:10px;")
  end  
  
  def update_button(options={})
    content_tag('div', submit_tag(t(:button_update),options) , :style=>"float:left;margin-right:10px;")
  end
  
  def delete_button(options={},html_opt={},*mrparams)
    content_tag('div', link_to(t(:button_delete),options,html_opt,*mrparams) , :style=>"margin:5px 15px 0 15px;")
  end  
  
  def render_flash_messages
    s = ''
    flash.each do |k,v|
      s << "<div style='clear:both;'></div>"
      s << content_tag('div', v, :class => "flash #{k}", :id=>"flash_#{k}")
    end
    s.html_safe
  end  
  
end
