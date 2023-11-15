import ReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives
func counterReducer(action: Action, state: AppState?) -> AppState {
    // if no state has been provided, create the default state
    var state = state ?? AppState()
    
    switch action {
    case _ as CounterActionIncrease:
        return state.increaseCounter(value: 1)
    case _ as CounterActionDecrease:
        return state.decreaseCounter(value: 1)
    default:
        break
    }
    
    return state
}
