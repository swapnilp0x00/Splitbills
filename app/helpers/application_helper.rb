module ApplicationHelper
  def navbar
    if current_user
      link_to "Logout" , destroy_user_session_path,method: :delete , class: "btn btn-primary btn-danger pull-right"
    else
      link_to("Register" ,new_user_registration_path,class:"btn btn-primary") + ' ' + link_to("Login" , new_user_session_path,class:"btn btn-primary btn-info")
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
end
