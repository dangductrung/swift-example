import ReSwift

enum CountryListState {
    case loading
    case success(String)
}

struct AppState {
    var counter: Int = 0
    var countryListState: CountryListState = .loading
}
