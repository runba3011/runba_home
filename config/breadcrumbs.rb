crumb :root do
  link "ホーム", root_path
end

crumb :user_show do |user|
  link "ユーザー詳細" , user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "編集" , edit_user_path(user)
  parent :user_show , user
end

crumb :stickman_war do
  link "棒バトチャレンジ", stickman_war_index_path
  parent :root
end

crumb :stickman_war_all_character do
  link "キャラクター一覧", stickman_war_characters_path
  parent :stickman_war
end

# キャラクター情報詳細
crumb :stickman_war_character do |character_name , character_class , character_id|
  link character_name, stickman_war_characters_path(character_class , character_id)
  parent :stickman_war_all_character
end

crumb :stickman_war_stage do |stage|
  link "#{stage}ステージ選択", stickman_war_path(stage)
  parent :stickman_war
end

# ステージ詳細（攻略情報ページ）
crumb :stickman_war_detail do |stage_type , stage_name|
  link stage_name , root_path
  parent :stickman_war_stage , stage_type
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