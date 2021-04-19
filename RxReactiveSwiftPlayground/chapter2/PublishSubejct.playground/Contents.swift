import RxSwift
import ReactiveSwift

//RxSwift
print("--------RxSwift-----------")

let subject = PublishSubject<String>()

subject.onNext("1")

subject.subscribe{ value in
    print(value)
}
subject.onNext("2")
subject.onNext("3")

subject.onCompleted()
subject.onNext("3")

//ReactiveSwift
print("---------ReactiveSwift------------")
let (output, input) = Signal<String, Never>.pipe()

input.send(value: "1")
output.observe{ value in
    print(value.value)
}
input.send(value: "2")
input.send(value: "3")
input.sendCompleted()
input.send(value: "3")
