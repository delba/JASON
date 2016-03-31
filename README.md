<p align="center">
<img src="https://github.com/delba/JASON/raw/assets/JASON@2x.png">
</p>

<p align="center">
    <a href="https://travis-ci.org/delba/JASON"><img alt="Travis Status" src="https://img.shields.io/travis/delba/JASON.svg"/></a>
    <a href="https://img.shields.io/cocoapods/v/JASON.svg"><img alt="CocoaPods compatible" src="https://img.shields.io/cocoapods/v/JASON.svg"/></a>
    <a href="https://github.com/Carthage/Carthage"><img alt="Carthage compatible" src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"/></a>
</p>

JASON is a JSON deserializer written in Swift. It offers a nice and comprehensive API without sacrificing performance. The implementation is minimal and easily extendable; the library is tested and thoughtfully documented. JASON is fast. JASON is installable through Carthage.

<p align="center">
<a href="#features">Features</a> • <a href="#usage">Usage</a> • <a href="#installation">Installation</a> • <a href="#license">License</a>
</p>

## Features

- [x] Built for performance - [`benchmarks`](https://github.com/delba/JASON/tree/benchmarks)
- [x] User-friendly API
- [x] Fully tested and documented
- [x] Installation via Carthage
- [x] Extensions available - [`extensions`](https://github.com/delba/JASON/tree/extensions)

```swift
extension JSONKeys {
    static let id    = JSONKey<Int>("id")
    static let title = JSONKey<String>("title")
    
    static let normal_image_url = JSONKey<NSURL?>(path: "images", "normal")
    static let hidpi_image_url  = JSONKey<NSURL?>(path: "images", "hidpi")
    
    static let user = JSONKey<JSON>("user")
    static let name = JSONKey<String>("name") 
}

struct Shot {
    let id: Int
    let title: String
    
    var normalImageURL: NSURL!
    var hidpiImageURL: NSURL?
    
    let user: User

    init(_ json: JSON) {
        id    = json[.id]
        title = json[.title]
        
        normalImageURL = json[.normal_image_url]
        hidpiImageURL  = json[.hidpi_image_url]
        
        user = User(json[.user])
    }
}

struct User {
    let id: Int
    let name: String

    init(_ json: JSON) {
        id   = json[.id]
        name = json[.name]
    }
}

Alamofire.request(.GET, "dribbble.com/shots")
    .responseJASON {
        // ...
        let shots = json.arrayJSON.map({ Shot.init })
    }
```

## Usage

### Initialization

JASON can be initialized with an instance of `AnyObject?` or `NSData?`.

```swift
let jsonFromAnyObject = JSON(object) // where object is an instance of AnyObject?
let jsonFromNSData = JSON(data) // where data is an instance of AnyData?
```

JASON implements *literal convertible protocols* and can be initialized from the following types:
- `Dictionary`
- `Array`
- `String`
- `Integer`
- `Float`
- `Bool`
- the value `nil`

For instance:

```swift
let brandon: JSON = [
    "name": "Brandon Walsh",
    "city": "Beverly Hills",
    "age" 17
]
```

### Accessing JSON values

You can access JSON values by using subscripts.

##### Using subscript

Use a subscript with an integer or a string key depending on whether the JSON is an array or a dictionary.

```swift
let friends: JSON = [
    "title": "Friends",
    "characters": [
        ["first_name": "Chandler", "last_name": "Bing"],
        ["first_name": "Phoebe", "last_name": "Buffay"],
        ["first_name": "Rachel", "last_name": "Green"],
        ["first_name": "Joey", "last_name": "Tribbiani"],
        ["first_name": "Monica", "last_name": "Geller"],
        ["first_name": "Ross", "last_name": "Geller"]
    ]
]

friends["title"]
```

##### Chaining subscript calls

Each subscript call returns an instance of JASON.JSON to allow chaining.

```swift
friends["characters"][0]["first_name"]
```

It will *never* break if the key doesn't exist or the index is out of bounds.

```swift
friends["whatever"][42]["whatever"][42] // that's fine too
```

Alternatively, you can use `json[path: Any...]`:

```swift
friends[path: "characters", 0, "first_name"]
```

##### Iterating over a JSON array

If the underlying JSON object is an array, you can iterate over it.

```swift
for character in friends["characters"] {
    character["first_name"]
}
```

### Casting JSON values

Next, you will want to convert a JASON.JSON object to a more appropriate type.

##### Using the internal object

You can do so by casting it's internal value like so:

```swift
let maybeName: String? = friends["characters"][0]["first_name"].object as? String
let name: String = friends["characters"][0]["first_name"].object as? String ?? ""
```

##### Using computed properties

JASON provides a set of computed properties to make anyone's job easier:

```swift
let maybeName = friends["characters"][0]["first_name"].string
let name = friends["characters"][0]["first_name"].stringValue
```

These getters come by two, `json.<type>` and `json.<type>Value`, and returns an optional or a non-optional type, respectively.

If the value can't be converted to the given type, the optional getter will return nil and the non-optional one a default value.

Property              | Type                   | Default value
-----------------     | ---------------------- | -------------
`string`              | `String?`              |
`stringValue`         | `String`               | `""`
`bool`                | `Bool?`                |
`boolValue`           | `Bool`                 | `false`
`int`                 | `Int?`                 |
`intValue`            | `Int`                  | `0`
`double`              | `Double?`              |
`doubleValue`         | `Double`               | `0.0`
`float`               | `Float?`               |
`floatValue`          | `Float`                | `0.0`
`array`               | `[AnyObject]?`         |
`arrayValue`          | `[AnyObject]`          | `[]`
`jsonArray`           | `[JSON]?`              |
`jsonArrayValue`      | `[JSON]`               | `[]`
`dictionary`          | `[String: AnyObject]?` |
`dictionaryValue`     | `[String: AnyObject]`  | `[:]`
`jsonDictionary`      | `[String: JSON]?`      |
`jsonDictionaryValue` | `[String: JSON]`       | `[:]`

> You can find more getters on the [`extensions` branch](https://github.com/delba/JASON/tree/extensions)

##### Using Operators

JASON defines three custom operators.

**1. `<?`**

`variable <? json` is the equivalent of `variable = json.<type>`.

```swift
let json: JSON = ["name": "sophie"]
var name: String?

name <? json["wrong"]
name // nil

name <? json["name"]
name // sophie
```

**2. `<!`**

`variable <! json` is the equivalent of `variable = json.<type>Value`.

```swift
let json: JSON = ["age": 23]
var age: Int!

age <! json["wrong"]
age // 0

age <! json["age"]
age // 23
```

**3. `<|`**

`variable <| json` is the equivalent of `if let value = json.<type> { variable = value }`.

```swift
let json: JSON = ["name": "sophie"]
var name = "margot"

name <| json["wrong"]
name // margot

name <| json["name"]
name // sophie
```

Here is a complete example:

```swift
struct User {
    var firstName: String!
    var lastName: String?
    var nickname = "none"

    init(_ json: JSON) {
        firstName <! json["first_name"]
        lastName  <? json["last_name"]
        nickName  <| json["nickname"]
    }
}

let json: JSON = [
    "first_name": "Rachel",
    "nickname": "Vintage Rachel"
]

let user = User(json)
user.firstName // Rachel
user.lastName // nil
user.nickname // Vintage Rachel
```

## Installation

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate JASON into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "delba/JASON" >= 1.0
```

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate JASON into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'JASON', '~> 1.0'
```

## License

Copyright (c) 2015 Damien (http://delba.io)

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
