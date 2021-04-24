import ReactiveSwift
import RxSwift


//RxSwift
print("--------RxSwift-----------")
let disposeBag = DisposeBag()

let numbers = Observable.of(2,3,4)

let observable = numbers.startWith(1)
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

print("---------ReactiveSwift-----------")
let signalProducer = SignalProducer.init(values:3,4,5)
signalProducer.prefix(SignalProducer.init(values:1, 2)).startWithValues { value in
    print(value)
    // 1
}
