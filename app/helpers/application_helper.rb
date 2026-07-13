module ApplicationHelper
  ROLE_LABELS = { "admin" => "管理者", "member" => "一般ユーザー" }.freeze

  def role_label(role)
    ROLE_LABELS.fetch(role, role)
  end
end
