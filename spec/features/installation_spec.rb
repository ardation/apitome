require "spec_helper"

feature "Installation" do
  before :each do
    `mkdir -p tmp`
    Dir.chdir "tmp/" do
      `rm -rf dummy`
      `cp -rf ../spec/dummy .`
      Dir.chdir "dummy" do
        `rm -rf doc`
        File.open("Gemfile", "a") { |f| f.write %{\ngem 'apitome', path: '../../../'\n} }
        `BUNDLE_GEMFILE="" bundle install`
      end
    end
  end

  it "installs the base files" do
    Dir.chdir "tmp/dummy" do
      expect(`bundle exec rails generate apitome:install`).to include(<<-OUTPUT.strip_heredoc)
              create  config/initializers/apitome.rb
              create  doc/api.md
              create  public/javascripts/apitome/application.js
              create  public/stylesheets/apitome/application.css
        +============================================================================+
        Congratulations! Apitome was successfully installed.
      OUTPUT
    end
  end

  it "can install without the asset files" do
    Dir.chdir "tmp/dummy" do
      expect(`bundle exec rails generate apitome:install --no-assets --trace`).to include(<<-OUTPUT.strip_heredoc)
              create  config/initializers/apitome.rb
              create  doc/api.md
        +============================================================================+
        Congratulations! Apitome was successfully installed.
      OUTPUT
    end
  end
end
