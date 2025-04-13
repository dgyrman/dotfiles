st() {
    # Set Session Name
    SESSION="meow"
    SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

    # Only create tmux session if it doesn't already exist
    if [ "$SESSIONEXISTS" = "" ]
    then
	# Start New Session with our name
	tmux new-session -d -s $SESSION
	tmux rename-window -t 1 'editor'

	tmux new-window -d -t $SESSION:2 -n 'server'
	tmux new-window -d -t $SESSION:3 -n 'scripts'
	tmux new-window -d -t $SESSION:4 -n 'free'
    fi
    
    # Finally, attach session
    tmux attach-session -t $SESSION:1
}
