import ReactiveSwift
import RxSwift


//RxSwift
print("--------RxSwift-----------")
let disposeBag = DisposeBag()

let first = Observable.of(1,2,3)
let second = Observable.of(4,5,6)

let observable = Observable.concat([first,second])

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)


print("---------ReactiveSwift-----------")
let signalFirst = SignalProducer.init(values:1,2,3)
let signalSecond = SignalProducer.init(values:3,4,5).concat(signalFirst)

signalSecond.startWithValues{
    value in
    print(value)
}


