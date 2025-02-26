python3 -m venv .venv
source .venv/bin/activate
pip install robotframework
pip install robotframework-requests

touch .gitignore
printf ".venv \n" >> .gitignore
printf "log \n" >> .gitignore