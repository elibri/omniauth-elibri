# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth_elibri/version"

Gem::Specification.new do |s|
  s.name        = "omniauth_elibri"
  s.version     = OmniauthElibri::VERSION
  s.authors     = ["Piotr Szmielew"]
  s.email       = ["p.szmielew@ava.waw.pl"]
  s.homepage    = "http://elibri.com.pl"
  s.summary     = %q{Omniauth strategy, log into your website using eLibri.com.pl account.}
  s.description = %q{Omniauth strategy, log into your website using eLibri.com.pl account. OAuth2 based strategy - requires you to provide id and secret that you can obtain from eLibri.com.pl site.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "omniauth-oauth2"
end
