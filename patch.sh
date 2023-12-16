dir=$(pwd)

case $dir in
*gitlab*) echo "Already cloned repo" ;;
*) git clone https://github/catppuccin/gitlab && cd gitlab ;;
esac

git submodule update --init --recursive

cp ./color.rb ./gitlab/lib/gitlab/color.rb

read -e -p "Which flavor would you like to use? mocha/macchiato/frappe/latte: " -i "mocha" chosen_flavor

echo "FLAVOUR = '$chosen_flavor'" >>./gitlab/config.ru
