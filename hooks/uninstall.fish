set __pride_erase_vars \
                    __pride_flag_style \
                    __pride_bind_mode \
                    __pride_username \
                    __pride_hostname \
                    __pride_emblem_status \
                    __pride_emblem_style \
                    __pride_prompt_style \
                    __pride_cat_status \
                    __pride_cat_style \
                    __pride_right_prompt \
                    __pride_username_color \
                    __pride_hostname_color \
                    __pride_at_color \
                    __pride_pwd_color \
                    __pride_connector_color \
                    __pride_emblem_color \
                    __pride_cat_color \
                    __pride_color_git_d \
                    __pride_color_git_r \
                    __pride_color_git_c \
                    __pride_color_git_a \
                    __pride_color_git_u \
                    __pride_color_git_m \
                    __pride_color_git_q \
                    __pride_flag \
                    __pride_cat \
                    __pride_flag \
                    __pride_emblem \
                    __pride_prompt \
                    __pride_assetfile \
                    __pride_configfile

for var in $__pride_erase_vars
    set -e $var
end