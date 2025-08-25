# Itacomp
Itacomp is a [View Component](https://viewcomponent.org/) and [Helper](https://api.rubyonrails.org/classes/ActionController/Helpers.html) collection for [Bootstrap Italia](https://italia.github.io/bootstrap-italia/).


## Usage
### Helpers
* [ita_visually_hidden](app/helpers/itacomp/common_helper.rb)
* [ita_icon](app/helpers/itacomp/common_helper.rb)

### Components
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

## Contributing
* Open a [issue](https://github.com/isprambiente/itacomp/issues)
* Fork the project
* Make a pull request
Your help is wellcome!

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
