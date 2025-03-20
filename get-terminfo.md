# generate the info for your terminal (-C for human readable, termcap)
`infocmp -C alacritty > alacritty-info`

# trasnfer this thing to the server
`rsync this thing`

# run this to set the value into terminfo
`tic -x -o ~/.terminfo alacritty-info`

