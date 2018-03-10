override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Soul"
  
  GIT_PROMPT_CONFLICTS="${Red}× "       # the number of files in conflict
  GIT_PROMPT_CHANGED="${Blue}+ "        # the number of changed files
  GIT_PROMPT_STASHED="${BoldBlue}stashed "    # the number of stashed files/dir
} 
 
reload_git_prompt_colors "Custom"

