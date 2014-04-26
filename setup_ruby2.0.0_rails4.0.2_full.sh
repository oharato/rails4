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
cat << EOS > Gemfile
source "http://rubygems.org"
gem "rails", "4.0.2"
EOS
bundle install --path vendor/bundle
bundle exec rails new example --skip-bundle
rm -f Gemfile
rm -f Gemfile.lock
rm -rf .bundle
rm -rf vendor/bundle
cd example
rm -f Gemfile
cat << EOS > Gemfile
source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0
gem 'rails', '4.0.2'
group :development do
  gem 'sqlite3', '1.3.8'
end
gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'
group :doc do
  gem 'sdoc', '0.3.20', require: false
end
gem 'therubyracer', platforms: :ruby
EOS
bundle install --path vendor/bundle
echo '/vendor/bundle' >> .gitignore
bundle exec rails s