crumb :root do
  link "ホーム", root_path
end

crumb :stickman_war do
  link "棒バトチャレンジ", stickman_war_index_path
  parent :root
end

crumb :stickman_war_stage do |stage|
  link "#{stage}ステージ選択", stickman_war_path(stage)
  parent :stickman_war
end

crumb :stickman_war_detail do
  link "ステージ詳細", root_path
  parent :stickman_war_stage
end

crumb :movies do
  link "動画視聴", movies_path
  parent :root
end

crumb :movie_show do |movie_name , movie_id|
  link "#{movie_name}", movie_path(movie_id)
  parent :movies
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