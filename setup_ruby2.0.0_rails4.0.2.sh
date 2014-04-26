sudo yum -y update
sudo yum -y install git gcc openssl-devel sqlite-devel gcc-c++ readline-devel postgresql-devel
cd ~
wget http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz
tar zxvf node-v0.10.26.tar.gz
cd node-v0.10.26
./configure
make
sudo make install
node -v
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs
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
rbenv rehash
echo '/vendor/bundle' >> .gitignore
RUBYOPT=-W0 bundle exec rails s