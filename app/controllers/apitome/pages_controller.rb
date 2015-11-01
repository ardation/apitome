class Apitome::PagesController < Apitome::BaseController
  layout Apitome.configuration.layout
  before_action :load_content
  def show
  end

  protected

  def load_content
    @content ||= markdown_file_for(params[:topic], "#{params[:file]}.md")
  end

  def markdown_file_for(topic, file)
    file = Apitome.configuration.root.join(Apitome.configuration.static_path, "pages", topic, file)
    raise Apitome::FileNotFoundError.new("Unable to find #{file}") unless File.exists?(file)
    rendered_markdown(File.read(file))
  end
end
