//import UIKit
//import RxSwift
//
////let helloRx = Observable.just("Hello RxSwift")
//
////let iOS = 1
////let android = 2
////let flutter = 3
////
////let observable2 = Observable.of(iOS, android, flutter)
////let observable21 = Observable.of([iOS, android, flutter])
////let observable3 = Observable.from([iOS, android, flutter])
//
////let observable = Observable<Int>.range(start: 1, count: 10)
////    var sum = 0
////    observable
////        .subscribe(
////            onNext: { i in
////                sum += i
////        } , onCompleted: {
////            print("Sum = \(sum)")
////        }
////    )
//
////let observable = Observable<Void>.empty()
//
////let observable = Observable<Any>.never()
////
////    observable.subscribe(
////        onNext: { element in
////            print(element)
////        },
////        onCompleted: {
////            print("Completed")
////        }
////    )
//
////observable.subscribe(
////  onNext: { element in
////    print(element)
////},
////  onCompleted: {
////    print("Completed")
////  }
////)
//
////observable3.subscribe(onNext: { element in
////    print(element)
////}, onError: { error in
////    print(error)
////}, onCompleted: {
////    print("Completed")
////}
////)
//
////helloRx.subscribe { (event) in
////    if let element = event.element {
////        print(element)
////    }
////}
////
////
////observable2.subscribe { (event) in
////    if let element = event.element {
////        print(element)
////    }
////}
////
////observable21.subscribe { (event) in
////    if let element = event.element {
////        print(element)
////    }
////}
////
////
////observable3.subscribe { (event) in
////    if let element = event.element {
////        print(element)
////    }
////}
//
//// MARK: Disposable
////enum MyError: Error {
////  case anError
////}
////
////let bag = DisposeBag()
////Observable<String>.create { observer -> Disposable in
////        observer.onNext("1")
////
////        observer.onNext("2")
////
////        observer.onNext("3")
////
//////        observer.onError(MyError.anError)
////
////        observer.onNext("4")
////
////        observer.onNext("5")
////
//////        observer.onCompleted()
////
////        observer.onNext("6")
////
////        return Disposables.create()
////}.subscribe(
////    onNext: { print($0) },
////    onError: { print($0) },
////    onCompleted: { print("Completed") },
////    onDisposed: { print("Disposed") }
////)
////.dispose()
////.disposed(by: bag)
//
////let disposeBag = DisposeBag()
////let subject = PublishSubject<String>()
////
////
////
////let subscription1 = subject.subscribe(
////    onNext: { value in
////        debugPrint("1: \(value)")
////    },
////    onCompleted: {
////        debugPrint("completed1")
////    },
////    onDisposed: {
////        debugPrint("dispose1")
////    }
////)
////
////let subscription2 = subject.subscribe(
////    onNext: { value in
////        debugPrint("2: \(value)")
////    },
////    onCompleted: {
////        debugPrint("completed2")
////    },
////    onDisposed: {
////        debugPrint("dispose2")
////    }
////)
////
////
////subject.onNext("tesT")
////subject.on(.completed)
////subscription.disposed(by: disposeBag)
//
////class Person {
////    let name: String
////    init(name: String) { self.name = name }
////    var apartment: Apartment?
////    deinit { print("\(name) is being deinitialized") }
////}
////
////
////class Apartment {
////    let unit: String
////    init(unit: String) { self.unit = unit }
////    weak var tenant: Person?
////    deinit { print("Apartment \(unit) is being deinitialized") }
////}
////
////var john: Person?
////var unit4A: Apartment?
////
////
////john = Person(name: "John Appleseed")
////unit4A = Apartment(unit: "4A")
////
////
////john!.apartment = unit4A
////unit4A!.tenant = john
////
//////john = nil
////
////unit4A = nil
////john = nil
//
////class Customer {
////    let name: String
////    var card: CreditCard?
////    init(name: String) {
////        self.name = name
////    }
////    deinit { print("\(name) is being deinitialized") }
////}
////
////
////class CreditCard {
////    let number: UInt64
////    unowned let customer: Customer
////    init(number: UInt64, customer: Customer) {
////        self.number = number
////        self.customer = customer
////    }
////    deinit { print("Card #\(number) is being deinitialized") }
////}
////
////var john: Customer?
////john = Customer(name: "John Appleseed")
////
//////var card: CreditCard? = CreditCard(number: 1234_5678_9012_3456, customer: john!)
////
////john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
////
//////john = nil
////john!.card = nil
////
//////card = nil
//////var a = 10
////
////print(john?.card)
//
//
//class Department {
//    var name: String
//    var courses: [Course]
//    init(name: String) {
//        self.name = name
//        self.courses = []
//    }
//
//    deinit { print("Department #\(name) is being deinitialized") }
//}
//
//
//class Course {
//    var name: String
//    unowned var department: Department
//    unowned var nextCourse: Course?
//    init(name: String, in department: Department) {
//        self.name = name
//        self.department = department
//        self.nextCourse = nil
//    }
//
//    deinit { print("Course #\(name) is being deinitialized") }
//}
//
//var department: Department? = Department(name: "Horticulture")
//
//
//var intro: Course? = Course(name: "Survey of Plants", in: department!)
//var intermediate: Course? = Course(name: "Growing Common Herbs", in: department!)
//var advanced: Course? = Course(name: "Caring for Tropical Plants", in: department!)
//
//
//intro?.nextCourse = intermediate
//intermediate?.nextCourse = advanced
//department!.courses = [intro!, intermediate!, advanced!]
//
//
//intro = nil
//advanced = nil
//
//department = nil
//

//let test: String {
//   print("test")
//    return "test"
//}
//
//test
//test
