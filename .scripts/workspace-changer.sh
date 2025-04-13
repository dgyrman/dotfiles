ws() {
    target_path="$CUSTOM_WS_DIR"
    user_prompt=$(ls -l $target_path | grep "^d" | awk '{print $9}' | fzf)
    if [[ ! -z "$user_prompt" ]]
	then target_path+="/$user_prompt"
	else return 
    fi

    user_prompt=$(ls -l $target_path | grep "^d" | awk '{print $9}' | fzf)
    if [[ ! -z "$user_prompt" ]]
	then target_path+="/$user_prompt"
	else return	
    fi


    cd $target_path
}
