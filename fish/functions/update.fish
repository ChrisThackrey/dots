function update --wraps='sudo apt update && apt list --upgradable' --description 'alias update sudo apt update && apt list --upgradable'
  sudo apt update && apt list --upgradable $argv; 
end
