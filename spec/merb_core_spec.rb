require 'spec_helper'

describe Merb::Generators::App::Core do

  describe "templates" do

    before :all do
      @generator = create_generator(Merb::Generators::App::Core, 'MerbCoreSpec')
    end

    after_generator_spec

    it_should_generate

    it_should_behave_like "named generator"
    it_should_behave_like "app generator"

    it "should write to the supplied application path" do
      @generator.destination_root.should == app_path
    end

    describe "File creation" do
      it_should_create(
        'Gemfile', 'bin/merb', 'config/init.rb',
        'app/controllers/application.rb',
        'app/controllers/exceptions.rb', '.gitignore'
      )

      it "should create a number of views"

      it "should create an empty lib/tasks directory" do
        File.directory?(app_path('lib/tasks')).should be_true
      end
    end

  end

end
