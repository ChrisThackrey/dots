function cap --wraps='setxkbmap -option' --description 'alias cap setxkbmap -option'
  setxkbmap -option $argv; 
end
