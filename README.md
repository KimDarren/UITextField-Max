UITextField+Max
======================

![CocoaPods](https://cocoapod-badges.herokuapp.com/v/UITextField+Max/badge.png) [![works badge](https://cdn.rawgit.com/nikku/works-on-my-machine/v0.2.0/badge.svg)](https://github.com/nikku/works-on-my-machine)

Extension of `UITextField` to set the MAX/LIMIT LENGTH to your text field.

Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'UITextField+Max'
```


Usage
-----

Create `UITextField`, then set `maxLength`.

```objc
UITextField *textField = [[UITextField alloc] init];
textField.maxLength = 10;
```

It's really simple, right?

Demo
----

There is a simple DEMO PROJECT using `UITextField+Max` in [Demo](Demo/) directory.


License
-------

**UITextField+Max** is under [WTFPL](http://www.wtfpl.net/). You can do what the fuck you want with this shit. See [LICENSE](LICENSE) file for more info.
