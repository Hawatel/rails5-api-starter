RspecApiDocumentation.configure do |config|
  # Output folder
  config.docs_dir = Rails.root.join("doc", "spec_documentation")

  # Output format
  config.format = [:html]

  # Change the name of the API on index pages
  config.api_name = "API Documentation"
end
