# set of variables to initialize
set -U __pride_vars \
                    __pride_flag_style \
                    __pride_bind_mode \
                    __pride_username \
                    __pride_hostname \
                    __pride_emblem_status \
                    __pride_emblem_style \
                    __pride_prompt_style \
                    __pride_cat_status \
                    __pride_cat_style \
                    __pride_right_prompt 

for var in $__pride_vars
    set -U $var default
end