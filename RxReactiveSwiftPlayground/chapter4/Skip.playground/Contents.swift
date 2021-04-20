import RxSwift
import ReactiveSwift

//RxSwift
print("--------RxSwiftSkip-----------")

let observable = Observable.of(1,2,3,4,5)

observable.skip(2).subscribe { event in
    print(event)
    //next(1)
    //completed
}
print("--------RxSwiftSkipWhile-----------")
let observable2 = Observable.of(2,2,3,4,5)

observable2.skipWhile{ $0 % 2 == 0}.subscribe { event in
    print(event)
}

print("--------RxSwiftSkipUntil-----------")

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()


subject.skip(until: trigger).subscribe{ value in
    print(value)
}
subject.onNext("1")
subject.onNext("1")
trigger.onNext("1")
subject.onNext("1")



//ReactiveSwift
print("---------ReactiveSwiftSkip------------")
let signalProducer = SignalProducer.init(values:1,2,3,4,5)

signalProducer.skip(first: 2).startWithValues { value in
    print(value)
    // 1
}

print("---------ReactiveSwiftSkipWhile------------")
let signalProducer2 = SignalProducer.init(values:2,2,3,4,6)

signalProducer2.skip(while: { value in return value % 2 == 0 }).startWithValues { value in
    print(value)
    // 1
}

print("---------ReactiveSwiftSkipUntil------------")
let (subjectOutput, subjectInput) = Signal<String, Never>.pipe()
let (triggerOutput, triggerInput) = Signal<Void, Never>.pipe()

subjectOutput.skip(until: triggerOutput).observe{ value in
    print(value.value)
}
subjectInput.send(value: "2")
subjectInput.send(value: "3")
triggerInput.send(value: ())
subjectInput.send(value: "4")
