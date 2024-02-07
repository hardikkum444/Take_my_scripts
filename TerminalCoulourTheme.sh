
#This is the classic hecker theme

#Set terminal background to black and text color to neon green
echo -e "\033]11;#000000\007" # Set background to black
echo -e "\033]10;#00FF00\007" # Set text color to neon green

-------------------------------------------------------------------

#This is my current neonish based colour theme

# Set terminal background to dark color
echo -e "\033]11;#000000\007"

# Set username color to light green
PS1='\[\e[38;5;196;1m\]\u\[\e[0m\]'

# Set hostname color to neon pink
PS1+='@\[\e[38;5;207m\]\h\[\e[0m\]'

# Set current directory color to bold magenta
PS1+=':\[\e[1;35m\]\w\[\e[0m\]'

# Set normal input text color to cyan blue
echo -e "\033]10;#00FFFF\007"

# Add a new line for the next prompt
PS1+=' \n\$ '

# Or if you just want a space not a new line
PS1+=' \$ '

-------------------------------------------------------------------

#(Orange blue colour theme)

# Set terminal background to a very dark blue 
echo -e "\033]11;#000022\007"

# Set username color to light green
PS1='\[\e[38;5;196;1m\]\u\[\e[0m\]'

# Set hostname color to neon pink
PS1+='@\[\e[38;5;207m\]\h\[\e[0m\]'

# Set current directory color to bold purple
PS1+=':\[\e[1;35m\]\w\[\e[0m\]'

# Set normal input text color to orange -->

#lighter orange 
#echo -e "\033]10;#FFA500\007"

#darker orange 
echo -e "\033]10;#FF8000\007"
