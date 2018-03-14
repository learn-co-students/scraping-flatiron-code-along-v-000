
[1mFrom:[0m /home/nitrous/code/labs/scraping-flatiron-code-along-v-000/lib/scraper.rb @ line 18 :

    [1;34m13[0m:       course.title = post.css([31m[1;31m"[0m[31mh2[1;31m"[0m[31m[0m).text
    [1;34m14[0m:       course.schedule = post.css([31m[1;31m"[0m[31m.date[1;31m"[0m[31m[0m).text
    [1;34m15[0m:       course.description = post.css([31m[1;31m"[0m[31mp[1;31m"[0m[31m[0m).text
    [1;34m16[0m:     [32mend[0m
    [1;34m17[0m: [32mend[0m
 => [1;34m18[0m:   binding.pry
    [1;34m19[0m: 
    [1;34m20[0m: 
    [1;34m21[0m:    [1;34m# def print_courses[0m
    [1;34m22[0m:     [1;34m#self.make_courses[0m
    [1;34m23[0m:     [1;34m#Course.all.each do |course|[0m

