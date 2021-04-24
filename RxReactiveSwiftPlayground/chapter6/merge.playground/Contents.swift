import ReactiveSwift
import RxSwift


//RxSwift
print("--------RxSwift-----------")
let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let source = Observable.of(left.asObservable(),right.asObservable())

let observable = source.merge()
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

left.onNext(5)
left.onNext(3)
right.onNext(2)
right.onNext(1)
left.onNext(99)


print("---------ReactiveSwift-----------")
//ReactiveSwift
let (leftOutput,leftInput) = Signal<Int, Never>.pipe()
let (rightOutput,rightInput) = Signal<Int, Never>.pipe()


let mergedSignalProducer = SignalProducer<Int, Never>.merge(leftOutput.producer,rightOutput.producer)

mergedSignalProducer.startWithValues{
    value in
    print(value)
}

leftInput.send(value:5)
rightInput.send(value:3)
leftInput.send(value:2)
rightInput.send(value:1)
leftInput.send(value:99)
