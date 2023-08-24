require "html-proofer"

# References:
# https://github.com/gjtorikian/html-proofer
# https://alexwlchan.net/2019/checking-jekyll-sites-with-htmlproofer/
# https://github.com/episource/jekyll-html-proofer/blob/master/jekyll-html-proofer.rb

HIGHEST_PRIORITY = Jekyll::Hooks::PRIORITY_MAP[:high] + 1000

Jekyll::Hooks.register(:site, :post_write, priority: HIGHEST_PRIORITY) do |site|
  begin
    HTMLProofer.check_directory(site.config["destination"], opts = {
      :check_html => true,
      :check_img_http => true,
      :disable_external => false,
      :only_4xx => true,
      :report_invalid_tags => true,
      :cache => { :timeframe => { external: '2w' }, :storage_dir => '.htmlproofer-cache' },
      :typhoeus => {
        :headers => { 'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0' }
      }
    }).run
  rescue Exception => e
    if site.config['watch']
      STDERR.puts e
    else
      raise e
    end
  end
end
