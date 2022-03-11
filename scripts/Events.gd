extends Node

signal change_cursor(cursor)
signal price_change(amount)
signal price_change_user(amount)
signal score_balloon(amount, btm, top)
signal damage_tick

signal photoshop_delete
signal photoshop_paste
signal photoshop_upload
signal photoshop_freeze

signal photoshop_enable_upload
signal photoshop_enable_delete
signal photoshop_enable_paste

signal open_email(index, email)
signal delete_email
signal email_link
signal insert_email(email)
signal delete_daily_email

signal open_window(node)
signal close_window

signal unpause_game
signal pause_game(already_paused)

signal reddit_upvote
signal reddit_downvote
signal reddit_queue(n)

signal new_level(level)
signal linear_level_completed
signal next_level
signal win_level
signal lose_level

signal select_state(state)
signal beat_captcha

signal tweet_clicked
