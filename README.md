<p align="center">
<img src="https://github.com/delba/JASON/raw/assets/JASON.png">
</p>

n      | JASON 2.0         | SwiftyJSON 2.3.1  | Δ
------ | ----------------- | ----------------- | -------
100    | 0.006 (24% STDEV) | 0.012 (38% STDEV) | ~2.00x
1000   | 0.049 (5% STDEV)  | 0.108 (8% STDEV)  | ~2.20x
10000  | 0.506 (2% STDEV)  | 1.098 (3% STDEV)  | ~2.16x

##### Running the tests

```bash
~$ git clone -b benchmarks https://github.com/delba/JASON.git && cd JASON
JASON$ carthage update
JASON$ xcodebuild test -project Benchmarks.xcodeproj -scheme Benchmarks -destination "platform=iOS Simulator,name=iPhone 6s"
```

##### The tests

[`BenchmarksTests/Struct.swift`](https://github.com/delba/JASON/blob/benchmarks/BenchmarksTests/Struct.swift)

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

    init(_ json: JASON.JSON) {
        // The properties are set
    }
}
```

[`BenchmarksTests/BenchmarksTests.swift`](https://github.com/delba/JASON/blob/benchmarks/BenchmarksTests/BenchmarksTests.swift)

```swift
class BenchmarksTest: XCTestCase {

    func testJASON_100 {
        measureBlock {
            for _ in 0..<100 {
                let json = JASON.JSON(object)
                let _ = Struct(json)
            }
        }
    }
    
    // etc.
}
```
