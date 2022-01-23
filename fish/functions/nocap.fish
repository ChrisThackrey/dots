function nocap --wraps='setxkbmap -option caps:escape' --description 'alias nocap setxkbmap -option caps:escape'
  setxkbmap -option caps:escape $argv; 
end
