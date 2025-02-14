{
  addressable = {
    dependencies = [ "public_suffix" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cl2qpvwiffym62z991ynks7imsm87qmgxf0yfsmlwzkgi9qcaa6";
      type = "gem";
    };
    version = "2.8.7";
  };
  afm = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "06kj9hgd0z8pj27bxp2diwqh6fv7qhwwm17z64rhdc4sfn76jgn8";
      type = "gem";
    };
    version = "0.2.2";
  };
  Ascii85 = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0nmyxpngg5rycyryhq9l9hapz1y3iqyflskyksxkqm0832a5vjqm";
      type = "gem";
    };
    version = "2.0.1";
  };
  async = {
    dependencies = [
      "console"
      "fiber-annotation"
      "io-event"
      "metrics"
      "traces"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0p29xccd3y96m7yb15yr96j362cz855ramn2x83g5z2642ag68w3";
      type = "gem";
    };
    version = "2.23.0";
  };
  base64 = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01qml0yilb9basf7is2614skjp8384h2pycfx86cr8023arfj98g";
      type = "gem";
    };
    version = "0.2.0";
  };
  bigdecimal = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1k6qzammv9r6b2cw3siasaik18i6wjc5m0gw5nfdc6jj64h79z1g";
      type = "gem";
    };
    version = "3.1.9";
  };
  colorator = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0f7wvpam948cglrciyqd798gdc6z3cfijciavd0dfixgaypmvy72";
      type = "gem";
    };
    version = "1.1.0";
  };
  concurrent-ruby = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ipbrgvf0pp6zxdk5ascp6i29aybz2bx9wdrlchjmpx6mhvkwfw1";
      type = "gem";
    };
    version = "1.3.5";
  };
  console = {
    dependencies = [
      "fiber-annotation"
      "fiber-local"
      "json"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1mkwwz5ry6hbn328fb3myr86zsc6lg0f7w1dlbfmjw043ddbgndg";
      type = "gem";
    };
    version = "1.29.2";
  };
  csv = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0kmx36jjh2sahd989vcvw74lrlv07dqc3rnxchc5sj2ywqsw3w3g";
      type = "gem";
    };
    version = "3.3.2";
  };
  em-websocket = {
    dependencies = [
      "eventmachine"
      "http_parser.rb"
    ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1a66b0kjk6jx7pai9gc7i27zd0a128gy73nmas98gjz6wjyr4spm";
      type = "gem";
    };
    version = "0.5.3";
  };
  ethon = {
    dependencies = [ "ffi" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "17ix0mijpsy3y0c6ywrk5ibarmvqzjsirjyprpsy3hwax8fdm85v";
      type = "gem";
    };
    version = "0.16.0";
  };
  eventmachine = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0wh9aqb0skz80fhfn66lbpr4f86ya2z5rx6gm5xlfhd05bj1ch4r";
      type = "gem";
    };
    version = "1.2.7";
  };
  ffi = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fgwn1grxf4zxmyqmb9i4z2hr111585n9jnk17y6y7hhs7dv1xi6";
      type = "gem";
    };
    version = "1.17.1";
  };
  fiber-annotation = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "00vcmynyvhny8n4p799rrhcx0m033hivy0s1gn30ix8rs7qsvgvs";
      type = "gem";
    };
    version = "0.2.0";
  };
  fiber-local = {
    dependencies = [ "fiber-storage" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01lz929qf3xa90vra1ai1kh059kf2c8xarfy6xbv1f8g457zk1f8";
      type = "gem";
    };
    version = "1.1.0";
  };
  fiber-storage = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0zxblmxwdpj3587wji5325y53gjdcmzxzm6126dyg58b3qzk42mq";
      type = "gem";
    };
    version = "1.0.0";
  };
  forwardable-extended = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "15zcqfxfvsnprwm8agia85x64vjzr2w0xn9vxfnxzgcv8s699v0v";
      type = "gem";
    };
    version = "2.6.0";
  };
  google-protobuf = {
    dependencies = [
      "bigdecimal"
      "rake"
    ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0rmmp533ypc5c2r3ks8zqxchqkf1g8laig87f7hdfmwz0p07cmcs";
      type = "gem";
    };
    version = "4.29.3";
  };
  hashery = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0qj8815bf7q6q7llm5rzdz279gzmpqmqqicxnzv066a020iwqffj";
      type = "gem";
    };
    version = "2.1.2";
  };
  html-proofer = {
    dependencies = [
      "addressable"
      "async"
      "nokogiri"
      "pdf-reader"
      "rainbow"
      "typhoeus"
      "yell"
      "zeitwerk"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0bv64vqgv2rq6n14ggyyvfh9lh51wfxpwqxibh5gwc9b75949qqv";
      type = "gem";
    };
    version = "5.0.9";
  };
  "http_parser.rb" = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gj4fmls0mf52dlr928gaq0c0cb0m3aqa9kaa6l0ikl2zbqk42as";
      type = "gem";
    };
    version = "0.8.0";
  };
  i18n = {
    dependencies = [ "concurrent-ruby" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "03sx3ahz1v5kbqjwxj48msw3maplpp2iyzs22l4jrzrqh4zmgfnf";
      type = "gem";
    };
    version = "1.14.7";
  };
  io-event = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1hag7zbmsvkbmv0486bxqvnngym4mhsj32aywwmklr5d21k2n9jc";
      type = "gem";
    };
    version = "1.9.0";
  };
  jekyll = {
    dependencies = [
      "addressable"
      "base64"
      "colorator"
      "csv"
      "em-websocket"
      "i18n"
      "jekyll-sass-converter"
      "jekyll-watch"
      "json"
      "kramdown"
      "kramdown-parser-gfm"
      "liquid"
      "mercenary"
      "pathutil"
      "rouge"
      "safe_yaml"
      "terminal-table"
      "webrick"
    ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1h8qpki1zcw4srnzmbba2gwajycm50w53kxq8l6vicm5azc484ac";
      type = "gem";
    };
    version = "4.4.1";
  };
  jekyll-feed = {
    dependencies = [ "jekyll" ];
    groups = [ "jekyll_plugins" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1hzwmjrxi57x68i7jx5rxi8qlcbqcbg3di55wywrp53pr0bap6k8";
      type = "gem";
    };
    version = "0.17.0";
  };
  jekyll-last-modified-at = {
    dependencies = [ "jekyll" ];
    groups = [ "jekyll_plugins" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "05d8x6kg90ghkvys2la6jgh70nfhf044asd7ch3v9sakfh9qzh64";
      type = "gem";
    };
    version = "1.3.2";
  };
  jekyll-postcss = {
    groups = [ "jekyll_plugins" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "06b28mcbibhg2jb1x0fk9hrqcwz5nk1v7vbhqw5fwddwhs2bj77l";
      type = "gem";
    };
    version = "0.5.0";
  };
  jekyll-sass-converter = {
    dependencies = [ "sass-embedded" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0hr4hsir8lm8aw3yj9zi7hx2xs4k00xn9inh24642d6iy625v4l3";
      type = "gem";
    };
    version = "3.1.0";
  };
  jekyll-seo-tag = {
    dependencies = [ "jekyll" ];
    groups = [ "jekyll_plugins" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0638mqhqynghnlnaz0xi1kvnv53wkggaq94flfzlxwandn8x2biz";
      type = "gem";
    };
    version = "2.8.0";
  };
  jekyll-sitemap = {
    dependencies = [ "jekyll" ];
    groups = [ "jekyll_plugins" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0622rwsn5i0m5xcyzdn86l68wgydqwji03lqixdfm1f1xdfqrq0d";
      type = "gem";
    };
    version = "1.4.0";
  };
  jekyll-watch = {
    dependencies = [ "listen" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1qd7hy1kl87fl7l0frw5qbn22x7ayfzlv9a5ca1m59g0ym1ysi5w";
      type = "gem";
    };
    version = "2.2.1";
  };
  json = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1p4l5ycdxfsr8b51gnvlvhq6s21vmx9z4x617003zbqv3bcqmj6x";
      type = "gem";
    };
    version = "2.10.1";
  };
  kramdown = {
    dependencies = [ "rexml" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "131nwypz8b4pq1hxs6gsz3k00i9b75y3cgpkq57vxknkv6mvdfw7";
      type = "gem";
    };
    version = "2.5.1";
  };
  kramdown-parser-gfm = {
    dependencies = [ "kramdown" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0a8pb3v951f4x7h968rqfsa19c8arz21zw1vaj42jza22rap8fgv";
      type = "gem";
    };
    version = "1.1.0";
  };
  liquid = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1czxv2i1gv3k7hxnrgfjb0z8khz74l4pmfwd70c7kr25l2qypksg";
      type = "gem";
    };
    version = "4.0.4";
  };
  listen = {
    dependencies = [
      "rb-fsevent"
      "rb-inotify"
    ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0rwwsmvq79qwzl6324yc53py02kbrcww35si720490z5w0j497nv";
      type = "gem";
    };
    version = "3.9.0";
  };
  mercenary = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0f2i827w4lmsizrxixsrv2ssa3gk1b7lmqh8brk8ijmdb551wnmj";
      type = "gem";
    };
    version = "0.4.0";
  };
  metrics = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1762zjanzjzr7jwig2arpj4h09ylhspipp9blx4pb9cjvgm8xv22";
      type = "gem";
    };
    version = "0.12.1";
  };
  mini_portile2 = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0x8asxl83msn815lwmb2d7q5p29p7drhjv5va0byhk60v9n16iwf";
      type = "gem";
    };
    version = "2.8.8";
  };
  nokogiri = {
    dependencies = [
      "mini_portile2"
      "racc"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gzqcs1kkykj8lrnbxc1iwr1wqmmaml8l6wyxdvy0vqq6gxiqyck";
      type = "gem";
    };
    version = "1.18.2";
  };
  pathutil = {
    dependencies = [ "forwardable-extended" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "12fm93ljw9fbxmv2krki5k5wkvr7560qy8p4spvb9jiiaqv78fz4";
      type = "gem";
    };
    version = "0.16.2";
  };
  pdf-reader = {
    dependencies = [
      "Ascii85"
      "afm"
      "hashery"
      "ruby-rc4"
      "ttfunk"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "06s17fbb9br58ng02kzwijch0kbdsjzr3rnrganr98s9q8hlanml";
      type = "gem";
    };
    version = "2.14.1";
  };
  public_suffix = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0vqcw3iwby3yc6avs1vb3gfd0vcp2v7q310665dvxfswmcf4xm31";
      type = "gem";
    };
    version = "6.0.1";
  };
  racc = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0byn0c9nkahsl93y9ln5bysq4j31q8xkf2ws42swighxd4lnjzsa";
      type = "gem";
    };
    version = "1.8.1";
  };
  rainbow = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "17850wcwkgi30p7yqh60960ypn7yibacjjha0av78zaxwvd3ijs6";
      type = "gem";
    };
    version = "13.2.1";
  };
  rb-fsevent = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zmf31rnpm8553lqwibvv3kkx0v7majm1f341xbxc0bk5sbhp423";
      type = "gem";
    };
    version = "0.11.2";
  };
  rb-inotify = {
    dependencies = [ "ffi" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0vmy8xgahixcz6hzwy4zdcyn2y6d6ri8dqv5xccgzc1r292019x0";
      type = "gem";
    };
    version = "0.11.1";
  };
  rexml = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ch4k2y80r4glr579kxliqnxld2qa91ydq8fiqam38bzpbps3gpg";
      type = "gem";
    };
    version = "3.4.0";
  };
  rouge = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pchwrkr0994v7mh054lcp0na3bk3mj2sk0dc33bn6bhxrnirj1a";
      type = "gem";
    };
    version = "4.5.1";
  };
  ruby-rc4 = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "00vci475258mmbvsdqkmqadlwn6gj9m01sp7b5a3zd90knil1k00";
      type = "gem";
    };
    version = "0.1.5";
  };
  safe_yaml = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0j7qv63p0vqcd838i2iy2f76c3dgwzkiz1d1xkg7n0pbnxj2vb56";
      type = "gem";
    };
    version = "1.0.5";
  };
  sass-embedded = {
    dependencies = [
      "google-protobuf"
      "rake"
    ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0b8gy2qm7m0dm0fvj1dnxz9wrrws8qz97r83874gzmdn27bamsv4";
      type = "gem";
    };
    version = "1.85.0";
  };
  terminal-table = {
    dependencies = [ "unicode-display_width" ];
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "14dfmfjppmng5hwj7c5ka6qdapawm3h6k9lhn8zj001ybypvclgr";
      type = "gem";
    };
    version = "3.0.2";
  };
  traces = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "109dh1xmsmvkg1pf3306svigh3m8kdmjqlznyk4bi2r4nws7hm6j";
      type = "gem";
    };
    version = "0.15.2";
  };
  ttfunk = {
    dependencies = [ "bigdecimal" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ji0kn8jkf1rpskv3ijzxvqwixg4p6sk8kg0vmwyjinci7jcgjx7";
      type = "gem";
    };
    version = "1.8.0";
  };
  typhoeus = {
    dependencies = [ "ethon" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0z7gamf6s83wy0yqms3bi4srirn3fc0lc7n65lqanidxcj1xn5qw";
      type = "gem";
    };
    version = "1.4.1";
  };
  unicode-display_width = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0nkz7fadlrdbkf37m0x7sw8bnz8r355q3vwcfb9f9md6pds9h9qj";
      type = "gem";
    };
    version = "2.6.0";
  };
  webrick = {
    groups = [
      "default"
      "jekyll_plugins"
    ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "12d9n8hll67j737ym2zw4v23cn4vxyfkb6vyv1rzpwv6y6a3qbdl";
      type = "gem";
    };
    version = "1.9.1";
  };
  yell = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1g16kcdhdfvczn7x81jiq6afg3bdxmb73skqjyjlkp5nqcy6y5hx";
      type = "gem";
    };
    version = "2.2.2";
  };
  zeitwerk = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0mi7b90hvc6nqv37q27df4i2m27yy56yfy2ki5073474a1h9hi89";
      type = "gem";
    };
    version = "2.7.1";
  };
}
