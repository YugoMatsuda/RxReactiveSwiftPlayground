import RxSwift
import ReactiveSwift


//RxSwift
let observable = Observable.just(1)

observable.subscribe { event in
    print(event)
    //next(1)
    //completed
}

//ReactiveSwift
let signalProducer = SignalProducer.init(value:1)

signalProducer.startWithValues { value in
    print(value)
    // 1
}
