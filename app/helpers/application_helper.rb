module ApplicationHelper
  # @param [String] app_label
  def bootstrap_label_class app_label
    { 'notice' => 'success',
      'alert' => 'danger'
    }[app_label] || app_label
  end
end
