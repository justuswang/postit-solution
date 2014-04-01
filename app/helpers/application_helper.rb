module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def display_datetime(datetime)
    if logged_in? && !current_user.time_zone.blank?
      datetime = datetime.in_time_zone(current_user.time_zone)
    end
    datetime.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
