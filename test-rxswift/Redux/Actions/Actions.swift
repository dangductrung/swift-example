import ReSwift
import RxSwift

// all of the actions that can be applied to the state
struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}

class FetchCountryAction: Action {
    public var disposable: Disposable?
}

struct UpdateCountryAction: Action {
    public var countryList: String
}

