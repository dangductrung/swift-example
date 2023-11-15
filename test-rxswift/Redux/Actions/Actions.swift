import ReSwift
import RxSwift

// all of the actions that can be applied to the state
struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}

struct FetchCountryData: Action {
    public var disposable: Disposable?
}

struct UpdateCountryData: Action {
    public var countryList: String
}

