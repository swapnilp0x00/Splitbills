module ApplicationHelper
  def navbar
    if current_user
      link_to "Logout" , destroy_user_session_path,method: :delete , class: "btn btn-primary btn-danger pull-right"
    else
      link_to("Register" ,new_user_registration_path,class:"btn btn-primary") + " ".html_safe + link_to("Login" , new_user_session_path,class:"btn btn-primary btn-info")
    end
  end

  def create_new_bill_button
    if current_user
      link_to 'Create New Bill', new_bill_path , class: "btn btn-primary btn-success"
    end
  end
  def create_show_bills_button
    if current_user
      link_to 'Show Bills', bills_path , class: "btn btn-primary btn-success"
    end
  end
  def create_dashboard_button
    if current_user
      link_to 'Dashboard', home_path , class: "btn btn-primary btn-info"
    end
  end
  def create_back_button
    link_to 'Back', bills_path , class:"btn btn-primary btn-info"
  end

  def hash_iterator(hash,type)
    str = ""
    hash.each do |key,value|
      user_name = User.find(key).name
      str += content_tag :li do
        content_tag('strong',"You #{type} #{user_name} : #{value}")
      end
    end
    str.html_safe
  end

  def final_status(amount)
    if !amount.nil?
      if amount > 0
        content_tag('h2',"You have lent total : #{amount} Rs")
      elsif amount < 0
        content_tag('h2',"You have borrowed total : #{amount.abs} Rs")
      else
        content_tag('h2',"Hurray !! You don't borrow or lent anything")
      end
    end
  end
end
