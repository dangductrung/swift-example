import ReSwift

struct AppState: StateType {
    var counter: Int = 0
    
    func increaseCounter(value: Int) -> AppState {
        AppState(counter: counter + value)
    }
    
    func decreaseCounter(value: Int) -> AppState {
        AppState(counter: counter - value)
    }
}
