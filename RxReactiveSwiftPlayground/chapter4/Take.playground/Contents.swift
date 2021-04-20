import RxSwift
import ReactiveSwift

//RxSwift
print("--------RxSwiftTake-----------")

let observable = Observable.of(1,2,3,4,5)

observable.take(3).subscribe { event in
    print(event)
    //next(1)
    //completed
}

print("--------RxSwiftTakeUntil-----------")

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()


subject.take(until: trigger).subscribe{ value in
    print(value)
}
subject.onNext("1")
subject.onNext("2")
trigger.onNext("1")
subject.onNext("3")

print("---------ReactiveSwiftTake------------")
let signalProducer = SignalProducer.init(values:1,2,3,4,5)

signalProducer.take(first: 3).startWithValues { value in
    print(value)
    // 1
}

print("---------ReactiveSwiftTakeUntil------------")
let (subjectOutput, subjectInput) = Signal<String, Never>.pipe()
let (triggerOutput, triggerInput) = Signal<Void, Never>.pipe()

subjectOutput.take(until: triggerOutput).observe{ value in
    print(value.value)
}
subjectInput.send(value: "2")
subjectInput.send(value: "3")
triggerInput.send(value: ())
subjectInput.send(value: "4")
