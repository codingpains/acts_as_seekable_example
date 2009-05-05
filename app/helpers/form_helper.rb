module FormHelper
  def required
    "<span class=\"required\">*</span>"
  end

  def delete_fields_link(fields, tag = "tr")
    out = ''
    unless fields.object.new_record?
      out << fields.hidden_field(:_delete)
      out << link_to_function("remove",
              "this.up('#{tag}').hide();
               hidden_input = this.previous('input[type=hidden]');
               hidden_input.value = '1';")
    else
      out << link_to_function("remove", "this.up('#{tag}').remove()")
    end
    out
  end

  def add_link_for(children_name, form_builder)
    children_name = children_name.to_sym unless children_name.class.equal?(Symbol)
    child = eval("form_builder.object.#{children_name.to_s}.build")
    link_to_function "add #{children_name.to_s.singularize.gsub(/_/,' ')}" do |page|
      form_builder.fields_for children_name, child,
      :child_index => 'NEW_RECORD' do |f|
       html = render(:partial => child.class.table_name.singularize,
                     :locals => { :form => f })
       page << "$('#{children_name.to_s}').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end

end
