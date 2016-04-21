<br/>
<h3 align="center">JASON</h3>
<br/>
<br/>

<p align="center">
    <a href="https://travis-ci.org/delba/JASON"><img alt="Travis Status" src="https://img.shields.io/travis/delba/JASON.svg"/></a>
    <a href="https://img.shields.io/cocoapods/v/JASON.svg"><img alt="CocoaPods compatible" src="https://img.shields.io/cocoapods/v/JASON.svg"/></a>
    <a href="https://github.com/Carthage/Carthage"><img alt="Carthage compatible" src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"/></a>
</p>

**`JASON`** is a faster JSON deserializer written in Swift.

<p align="center">
<a href="#features">Features</a> • <a href="#usage">Usage</a> • <a href="#example">Example</a> • <a href="#references">References</a> • <a href="#installation">Installation</a> • <a href="#license">License</a>
</p>

## Features

- [x] Very [fast](https://github.com/delba/JASON/tree/benchmarks)
- [x] Fully tested
- [x] Fully documented
<p></p>
- [x] Clean code
- [x] Beautiful API
- [x] Regular updates
<p></p>
- [x] Support for iOS, OSX, tvOS, watchOS
- [x] Compatible with [Carthage](https://github.com/delba/JASON#carthage)/[CocoaPods](https://github.com/delba/JASON#cocoapods)
- [x] Provide [extensions](https://github.com/delba/JASON/tree/master/Extensions)

## Usage

##### Initialization

```swift
let json = JSON(anything)
```

```swift
let json: JSON = xxxLiteralConvertible
```

```swift
Alamofire.request(.GET, URL).responseJASON { response in
    if let json = response.result.value {
        print("JSON: \(json)")
    }
}
```

If the underlying JSON object is an array, you can iterate over it:

```swift
let people = json.map(Person.init)
```

### Casting JSON values

##### Using computed properties

```swift
json["people"][0]["name"]
```

Alternatively, you can use `json[path: Any...]`:

```swift
json[path: "people", 0, "name"]
```

**`JASON`** provides a set of computed properties to make anyone's job easier:

```swift
let maybeName = json[path: "people", 0, "name"].string
let name = json[path: "people", 0, "name"].stringValue
```

These getters come by two, `json.<type>` and `json.<type>Value`, and returns an optional or a non-optional type, respectively.

If the value can't be converted to the given type, the optional getter will return nil and the non-optional one a default value.

**`JASON`** gives you access to the internal object (`AnyObject`) so you can cast the value to anything you want:

```swift
let name = json["people"][0]["name"].object as? String ?? ""
```

##### Using `JSONKey`

## Example

```swift
extension JSONKeys {
    static let id    = JSONKey<Int>("id")
    static let title = JSONKey<String>("title")
    
    static let normalImageURL = JSONKey<NSURL?>(path: "images", "normal")
    static let hidpiImageURL  = JSONKey<NSURL?>(path: "images", "hidpi")
    
    static let user = JSONKey<JSON>("user")
    static let name = JSONKey<String>("name") 
}
```

```swift
struct Shot {
    let id: Int
    let title: String
    
    var normalImageURL: NSURL!
    var hidpiImageURL: NSURL?
    
    let user: User

    init(_ json: JSON) {
        id    = json[.id]
        title = json[.title]
        
        normalImageURL = json[.normalImageURL]
        hidpiImageURL  = json[.hidpiImageURL]
        
        user = User(json[.user])
    }
}
```

```swift
struct User {
    let id: Int
    let name: String

    init(_ json: JSON) {
        id   = json[.id]
        name = json[.name]
    }
}
```

## References

                         | Property              | JSONKey Type           | Default value
 ----------------------- | --------------------- | ---------------------- | -------------
 **JSON**                | `json`                | `JSON`                 |
 **String**              | `string`              | `String?`              |
                         | `stringValue`         | `String`               | `""`
 **Integer**             | `int`                 | `Int?`                 |
                         | `intValue`            | `Int`                  | `0`
 **FloatingPointType**   | `double`              | `Double?`              |
                         | `doubleValue`         | `Double`               | `0.0`
                         | `float`               | `Float?`               |
                         | `floatValue`          | `Float`                | `0.0`
                         | `cgFloat`             | `CGFloat?`             |
                         | `cgFloatValue`        | `CGFloat`              | `0.0`
 **Bool**                | `bool`                | `Bool?`                |
                         | `boolValue`           | `Bool`                 | `false`
 **NSURL**               | `nsURL`               | `NSURL?`               |
 **Dictionary**          | `dictionary`          | `[String: AnyObject]?` |
                         | `dictionaryValue`     | `[String: AnyObject]`  | `[:]`
                         | `jsonDictionary`      | `[String: JSON]?`      |
                         | `jsonDictionaryValue` | `[String: JSON]`       | `[:]`
                         | `nsDictionary`        | `NSDictionary?`        |
                         | `nsDictionaryValue`   | `NSDictionary`         | `NSDictionary()`
 **Array**               | `array`               | `[AnyObject]?`         |
                         | `arrayValue`          | `[AnyObject]`          | `[]`
                         | `jsonArray`           | `[JSON]?`              |
                         | `jsonArrayValue`      | `[JSON]`               | `[]`
                         | `nsArray`             | `NSArray?`             |
                         | `nsArrayValue`        | `NSArray`              | `NSArray()`

> You can find more getters on the [`extensions` branch](https://github.com/delba/JASON/tree/extensions)

## Installation

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate **`JASON`** into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "delba/JASON" >= 2.0
```

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate **`JASON`** into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'JASON', '~> 2.0'
```

## License

Copyright (c) 2015-2016 Damien (http://delba.io)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
