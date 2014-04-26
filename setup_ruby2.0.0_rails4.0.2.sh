sudo yum -y update
sudo yum -y install git gcc openssl-devel sqlite-devel gcc-c++
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
rbenv install 2.0.0-p451
rbenv global 2.0.0-p451
rbenv exec gem update --system 2.0.3
rbenv exec gem install bundler
rbenv rehash
cd /vagrant/example
bundle install --path vendor/bundle
echo '/vendor/bundle' >> .gitignore
RUBYOPT=-W0 bundle exec rails s