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
100    | 0.006 (24% STDEV) | 0.012 (38% STDEV) | ~2.00x
1000   | 0.049 (5% STDEV)  | 0.108 (8% STDEV)  | ~2.20x
10000  | 0.506 (2% STDEV)  | 1.098 (3% STDEV)  | ~2.16x
