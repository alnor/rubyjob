module ApplicationHelper
  
  def create_button(options={})
    content_tag('div', submit_tag(t(:button_create),options) , :style=>"float:left")
  end  
  
  def cancel_button(options={})
    options = {:type => 'button', :onClick=>"parent.location='" + url_for(:action=>'index')+"'"} if !options.any?
    content_tag('div', submit_tag(t(:button_cancel),options) , :style=>"float:left")
  end  
  
  def update_button(options={})
    content_tag('div', submit_tag(t(:button_update),options) , :style=>"float:left")
  end
  
  def delete_button(options={},html_opt={},*mrparams)
    content_tag('div', link_to(t(:button_delete),options,html_opt,*mrparams) , :style=>"float:right")
  end  
  
  def render_flash_messages
    s = ''
    add_fade = false
    flash.each do |k,v|
      s << link_to_function(t(:hide_flash), "$('flash_#{k}').hide();this.hide()", {:id => 'hide_flash'})
      s << "<div style='clear:both;'></div>"
      s << content_tag('div', v, :class => "flash #{k}", :id=>"flash_#{k}")
      add_fade = true if k.to_s=='notice'
    end
    s << "<script type = 'text/javascript'> setTimeout(\"new Effect.Fade('flash_notice');\", 100000); </script>" if  add_fade
    s
  end  
  
end
