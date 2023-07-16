
# Check if the shell is ZSH
if [ -n "$ZSH_VERSION" ]; then
  read "AWS_USERNAME?Input your AWS username: "
  read "AWS_ACCESS_KEY_ID?Input your AWS_ACCESS_KEY_ID: "
  read  "AWS_SECRET_ACCESS_KEY?Input your AWS_SECRET_ACCESS_KEY (not echoed): "
  export AWS_USERNAME AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
# Check if the shell is Bash
else
  [ -z "$AWS_USERNAME" ] && read -p "Input your AWS username: " AWS_USERNAME
  echo
  [ -z "$AWS_ACCESS_KEY_ID" ] && read -p "Input your AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
  echo
  [ -z "$AWS_SECRET_ACCESS_KEY" ] && read -p "Input your AWS_SECRET_ACCESS_KEY (not echoed): " -s AWS_SECRET_ACCESS_KEY
  echo
  export AWS_USERNAME AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
  # For Ubuntu
  export BOTO_USE_ENDPOINT_HEURISTICS=True
fi

# Show you loaded the keys via the prompt
export PS1="(AWS)$PS1"
