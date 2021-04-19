import RxSwift
import ReactiveSwift

//RxSwift
print("--------RxSwift-----------")

let subject = BehaviorSubject(value: "initial value")
subject.onNext("next value")
subject.onNext("next")

subject.subscribe{ value in
    print(value)
}
subject.onNext("last")


//ReactiveSwift
print("---------ReactiveSwift------------")
let mutableProperty = MutableProperty<String>("1")

//signalでは値の初期値は流れてこない
mutableProperty.signal.observeValues{ value in
    print("signal",value)
}
//producerでは値の初期値は流れてくる
mutableProperty.producer.startWithValues{ value in
    print("producer",value)
}
mutableProperty.value = "aaaaa"
