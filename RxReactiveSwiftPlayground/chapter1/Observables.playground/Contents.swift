import RxSwift
import ReactiveSwift
import Combine

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

//Combine
let publisher = Just(1)
    
publisher.sink { value in
    print(value)
    }
