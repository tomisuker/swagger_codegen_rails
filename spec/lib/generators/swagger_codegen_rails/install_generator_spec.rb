require 'rails_helper'
require 'generators/swagger_codegen_rails/install/install_generator'
require 'support/generators'

describe SwaggerCodegenRails::InstallGenerator, type: :generator do

  setup_generator_test

  it 'runs all tasks' do
    gen = generator %w(api)
    expect(gen).to receive :create_initializer_file
    expect(gen).to receive :create_concern_dir
    expect(gen).to receive :create_swagger_controller_file
    expect(gen).to receive :insert_ui_route
    gen.invoke_all
  end

  describe "generated files without namespace" do
    before do
      run_generator %w(.)
    end

    describe "initializer file" do
      subject { file("config/initializers/swagger_ui_engine.rb") }
      it { is_expected.to exist }
      it { is_expected.to contain(/SwaggerUiEngine.configure do |config|/) }
    end

    describe "swagger_controller file" do
      subject { file("app/controllers/swagger_controller.rb") }
      it { is_expected.to exist }
    end

    describe "route file" do
      subject { file("config/routes.rb") }
      it { is_expected.to contain(/mount SwaggerUiEngine::Engine, at:/) }
    end

    describe "concern dir" do
      subject { File.directory?("app/controllers/concern") }
      it { is_expected.to be true }
    end
  end

  describe "generated files with namespace" do
    before do
      run_generator %w(api/v1)
    end

    describe "initializer file" do
      subject { file("config/initializers/swagger_ui_engine.rb") }
      it { is_expected.to exist }
      it { is_expected.to contain(/SwaggerUiEngine.configure do |config|/) }
    end

    describe "swagger_controller file" do
      subject { file("app/controllers/api/v1/swagger_controller.rb") }
      it { is_expected.to exist }
    end

    describe "route file" do
      subject { file("config/routes.rb") }
      it { is_expected.to contain(/mount SwaggerUiEngine::Engine, at:/) }
    end
  end
end
