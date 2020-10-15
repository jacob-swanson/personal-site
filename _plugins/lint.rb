require "html-proofer"

Jekyll::Hooks.register :site, :post_write do |site|
  HTMLProofer.check_directory(site.config["destination"], opts = {
    :check_html => true,
    :check_img_http => true,
    :disable_external => false,
    :only_4xx => true,
    :report_invalid_tags => true,
    :cache => { :timeframe => '2w', :storage_dir => '.htmlproofer-cache' }
  }).run
end
