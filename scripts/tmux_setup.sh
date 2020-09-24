#!/bin/sh

session="ml2"

# start tmux server
tmux start-server

# create new tmux sesh, with window 0 named "cvip"
tmux new-session -d -s $session -n cvip -c ~/basic_data/cvip

# split window vertically by 50% and set it to same path
tmux splitw -t $session:cvip -v -p 50 -c "#{pane_current_path}"

# run env setup in pane 0 and pane 1
tmux send-keys -t $session:cvip.0 "source cvcore_setup.sh;brunch raven userdebug" C-m
tmux send-keys -t $session:cvip.1 "source cvcore_setup.sh;brunch raven userdebug" C-m

# create new window for acamas
tmux new-window -t $session -n acamas -c ~/basic_data/acamas
tmux splitw -t $session:acamas -v -p 50 -c "#{pane_current_path}"
tmux send-keys -t $session:acamas.0 "source build/envsetup.sh;lunch acamas-userdebug" C-m
tmux send-keys -t $session:acamas.1 "source build/envsetup.sh;lunch acamas-userdebug" C-m

# create new window for mero
tmux new-window -t $session -n mero -c ~/basic_data/mero
tmux splitw -t $session:mero -v -p 50 -c "#{pane_current_path}"
tmux send-keys -t $session:mero.0 "source build/envsetup.sh;lunch demophon-userdebug" C-m
tmux send-keys -t $session:mero.1 "source build/envsetup.sh;lunch demophon-userdebug" C-m

# create new window for hydra
tmux new-window -t $session -n hydra -c ~/basic_data/hydra
tmux splitw -t $session:hydra -v -p 50 -c "#{pane_current_path}"
tmux send-keys -t $session:hydra.0 "cd build/targets/build_verification/build" C-m
tmux send-keys -t $session:hydra.0 "../../../bin/cmake .." C-m

# create new window for eci
tmux new-window -t $session -n eci -c ~/basic_data/framework
tmux send-keys -t $session:eci "source env_setup.sh" C-m

# attach to the tmux session
tmux attach-session -t $session

# propagate pane current path example
#new-window -c "#{pane_current_path}"

# pane select example
#tmux selectp -t $session:eg_name.1

# window select example
#tmux select-window -t $session:0

# rename window example
#tmux rename-window -t 0 'eg_name'

# create a new tmux session, starting vim from a saved session in the new window
#tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"

# https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened
