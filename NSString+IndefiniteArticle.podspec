Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  s.name         = "NSString+IndefiniteArticle"
  s.version      = "0.1.1"
  s.summary      = "An NSString category for providing an indefinite articles (a|an)"

  s.description  = <<-DESC
                    An NSString category for providing indefinite articles (a|an)
                    for a given string.

                    For example:

                    *  `[NSString indefiniteArticleForString:@"elipis"] => @"an"`
                    *  `[NSString indefiniteArticleForString:@"taco"] => @"a"`

                    or you can call it on a given string:

                    * `[@"historic event" indefiniteArticle] => @"a"`
                    * `[@"800 lb gorilla" indefiniteArticle] => @"an"`

                   DESC

  s.homepage     = "https://github.com/barclay/NSString-IndefiniteArticle"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  s.author             = { "barclay loftus" => "barclay@distinctpixel.com" }
  s.social_media_url   = "http://twitter.com/barclay"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #

  s.source       = { :git => "https://github.com/barclay/NSString-IndefiniteArticle.git", :tag => "0.1.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  s.source_files  = "Source", "Source/**/*.{h,m}"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  s.requires_arc = true

end
