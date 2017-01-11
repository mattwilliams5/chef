default["apache"]["sites"]["matt-williams-52"] = { "site_title" => "Matt-Williams-52 websites coming soon", "port" => 80, "domain" => "matt-williams-52.mylabserver.com" }
default["apache"]["sites"]["matt-williams-52b"] = { "site_title" => "Matt-Williams-52b websites coming soon!", "port" => 80, "domain" => "matt-williams-52b.mylabserver.com" }
default["apache"]["sites"]["matt-williams-53"] = { "site_title" => "Matt-Williams-53 websites coming soon!", "port" => 80, "domain" => "matt-williams-53.mylabserver.com" }

default["author"]["name"] = "matt"

case node["platform"]
when "centos"
	default["apache"]["package"] = "httpd"
when "ubuntu"
	default["apache"]["package"] = "apache2"
end
