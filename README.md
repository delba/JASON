<p align="center">
<img src="https://github.com/delba/JASON/raw/assets/benchmarks@2x.png">
</p>

```swift
struct Struct {
    let string: String
    let int: Int
    let double: Double
    let float: Float
    let bool: Bool
    let array: [AnyObject]
    let dictionary: [String: AnyObject]
    let optionalFloat: Float?
    let optionalString: String?
    let optionalInt: Int?
    let optionalDouble: Double?
    let optionalBool: Bool?
    let optionalArray: [AnyObject]?
    let optionalDictionary: [String: AnyObject]?

    init(_ json: JSON) {
        // The properties are set
    }
}
```

```swift
for _ in 0..<n {
    let json = JSON(object)
    Struct(json)
}
```

n      | JASON             | SwiftyJSON        | Δ
------ | ----------------- | ----------------- | -------
100    | 0.012 (15% STDEV) | 0.124 (10% STDEV) | ~10.33x
1000   | 0.117 (5% STDEV)  | 1.205 (8% STDEV)  | ~10.3x
10000  | 1.201 (2% STDEV)  | 11.300 (3% STDEV) | ~9.41x
