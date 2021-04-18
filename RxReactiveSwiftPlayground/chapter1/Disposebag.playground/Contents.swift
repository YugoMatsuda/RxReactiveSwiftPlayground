import RxSwift
import ReactiveSwift

//RxSwift
print("RXSwift")

let disposeBag = DisposeBag()
Observable.of("A","B","C").subscribe {
    print($0)
}.disposed(by: disposeBag)

//ReactiveSwift
//ReactiveSwiftでは、使い捨て品の保持や寿命の管理を手動で行う必要はほとんどなく、ほとんどが自動で行われます。

//RxSwift
print("RXSwift")
Observable<String>.create { observer in
    observer.onNext("1")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0)}, onCompleted: { print("onCompleted") }, onDisposed: {print("disposed")})
.disposed(by: disposeBag)

//ReactiveSwift
print("ReactiveSwift")

SignalProducer<String, Never> { observer, _ in
    observer.send(value: "1")
    observer.sendCompleted()
    observer.send(value: "?")
}.startWithValues { value in
    print(value)
    // 1
}
