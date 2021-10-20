# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w( 
  side_bar_page

  top/index
  top/show
  top/explain

  shared/link
  shared/footer
  shared/simple_link
  shared/common_header
  shared/show_account
  shared/prease_login
  shared/explain

  skill_room/index
  skill_room/common
  skill_room/show
  skill_room/language_link
  skill_room/skill_play_room_link

  stickman_war_common/stickman_war_header
  stickman_war_common/templete

  stickman_war/index
  stickman_war/show
  stickman_war/top_link
  stickman_war/stickman_war_explain
  stickman_war/stage_link
  

  stickman_war_detail/show
  stickman_war_detail/comment

  stickman_war_characters/character_link
  stickman_war_characters/index
  stickman_war_characters/show
  stickman_war_characters/avility_list
  stickman_war_characters/character_detail_explain

  movies/index
  movies/show
  movies/reccomend_movie_link
  movies/movie_link
  movies/common

  requests/new
  requests/request_background
  requests/create

  groups/side_bar
  groups/main_bar
  groups/common
  groups/messages
  groups/new
  groups/edit
  groups/index
  groups/show

  users/common
  users/index
  users/show
  users/edit

  all_user_requests/common
  all_user_requests/index
  all_user_requests/new
  all_user_requests/show
  all_user_requests/create

  material/index
  material/top_link
  material/show
  material/create
  material/common
  material/explain_table

  devise/common
  reset_field_with_errors
)
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
