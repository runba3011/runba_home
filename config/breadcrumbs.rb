crumb :root do
  link "ホーム", root_path
end

crumb :stickman_war do
  link "棒バトチャレンジ", root_path
  parent :root
end

crumb :stickman_war_stage do
  link "ステージ選択", root_path
  parent :stickman_war
end

crumb :stickman_war_detail do
  link "ステージ詳細", root_path
  parent :stickman_war_stage
end

crumb :movies do
  link "動画視聴", root_path
  parent :root
end

crumb :root do
  link "Home", root_path
end

crumb :root do
  link "Home", root_path
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).