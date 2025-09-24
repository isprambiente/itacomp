# Itacomp
Itacomp is a [View Component](https://viewcomponent.org/) and [Helper](https://api.rubyonrails.org/classes/ActionController/Helpers.html) collection for [Bootstrap Italia](https://italia.github.io/bootstrap-italia/).


## Usage
### Helpers
* [ita_donut](app/helpers/itacomp/common_helper.rb)
* [ita_icon](app/helpers/itacomp/common_helper.rb)
* [ita_progress](app/helpers/itacomp/common_helper.rb)
* [ita_spinner](app/helpers/itacomp/common_helper.rb)
* [ita_visually_hidden](app/helpers/itacomp/common_helper.rb)
* [ita_size](app/helpers/itacomp/common_helper.rb)
* [ita_bg](app/helpers/itacomp/common_helper.rb)
* [ita_text](app/helpers/itacomp/common_helper.rb)

### Components
* [AlertComponent](app/components/itacomp/alert_component.rb)
* [AvatorComponent](app/components/itacomp/avator_component.rb)
* [NotificationComponent](app/components/itacomp/notification_component.rb)
* [TurboFrameComponent](app/components/itacomp/turbo_frame_component.rb)

## Installation
Itacomp is in a rapid development phase and the gem will not be released on Rubygem until the [first project](https://github.com/orgs/isprambiente/projects/1) will be completed.
At moment is required make the gem locally:
```bash
$ git clone https://github.com/isprambiente/itacomp.github
$ cd itacomp
$ gem build
```
when the gem is builded go in your project and add this row in your Gemfile:
```ruby
gem "itacomp", path: '../itacomp'
```
Change `../itacomp` with your path of Itacomp project and update your project

```bash
$ bundle update
```

To add the helpers in your system add this helper in your application_helper.rb
```ruby
include Itacomp::CommonHelper
```

The ViewComponent are available with:
```ruby
# render Itacomp::NameOfComponent.new
render Itacomp::TurboFrameComponent.new(id: 'nav', href: '/nav.html')
```

## Make a demo app
Generate a new rails application "itademo" with [bun](https://bun.sh/) or [yarn](https://getyarn.io/) as javascript approach and sass as css manager
```
rails new itademo -c sass -j bun
cd itademo
```

Add itacompp gem in Gemfile.rb
```
gem "itacomp", path: "../itacomp"
```

and bundle it 
```
bundle update
```

Install bootstrap italia
```
bun install bootstrap-italia
```

Add bootstrap-italia style in `app/assets/stylesheets/application.sass.scss`
```
@forward "bootstrap-italia/src/scss/bootstrap-italia.scss";
```

Import bootstrap-italia in `app/javascript/application.js`
```
import "bootstrap-italia"
```

Generate a demo scaffold
```
./bin/rails g scaffold Book title:string body:text
```

define root as books index in `/config/routes.rb`
```
root "books#index"
```

Include Itacomp helper in `app/helpers/application_helper.rb`
```
include Itacomp::CommonHelper
```

Now you can update the layout in `app/views/layouts/application.html.erb` and the page in `app/views/books/index.html.erb`... **Thats all folk!**

## Contributing
* Open a [issue](https://github.com/isprambiente/itacomp/issues)
* Fork the project
* Make a pull request
Your help is wellcome!

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
