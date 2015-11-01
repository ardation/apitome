class Apitome::DocsController < Apitome::BaseController
  layout Apitome.configuration.layout

  helper_method :resources,
                :example,
                :formatted_body,
                :param_headers,
                :param_extras,
                :formatted_readme,
                :set_example,
                :id_for,
                :rendered_markdown

  def index
  end

  def show
  end

  def simulate
    request = example["requests"][0]
    if request
      request["response_headers"].each { |k, v| headers[k] = v }
      render text: request["response_body"], status: request["response_status"]
    else
      render text: "No simulation for this endpoint", status: 404
    end
  end
end
