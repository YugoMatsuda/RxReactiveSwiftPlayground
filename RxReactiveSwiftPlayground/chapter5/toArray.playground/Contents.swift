import RxSwift
import ReactiveSwift

//RxSwift
print("--------RxSwift-----------")
let observable = Observable.of(1,2,3,4,5)
observable.toArray().subscribe { event in
    print(event)
    //next(1)
    //completed
}

print("---------ReactiveSwift-----------")
let signalProducer = SignalProducer.init(values:2,2,3,4,6)
signalProducer.collect().startWithValues { value in
    print(value)
}
