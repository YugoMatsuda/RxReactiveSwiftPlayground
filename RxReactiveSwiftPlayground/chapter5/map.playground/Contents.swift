import RxSwift
import ReactiveSwift

//RxSwift
print("--------RxSwift-----------")
let observable = Observable.of(1,2,3,4,5)
observable.map { return $0 * 2 }
    .subscribe { event in
    print(event)
    //next(1)
    //completed
}

print("---------ReactiveSwift-----------")
let signalProducer = SignalProducer.init(values:1,2,3,4,5)
signalProducer.map { value in return value * 2 }
    .startWithValues { value in
    print(value)
}
