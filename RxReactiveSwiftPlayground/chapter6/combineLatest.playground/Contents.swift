import ReactiveSwift
import RxSwift


//RxSwift
print("--------RxSwift-----------")
let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let observable = Observable.combineLatest(left,right,resultSelector:{
    lastLeft, lastRight in
    "\(lastLeft) \(lastRight)"
})

let disposable = observable.subscribe(onNext: { value in
        print(value)
})

left.onNext(45)
right.onNext(1)
left.onNext(30)
right.onNext(99)
right.onNext(2)



print("---------ReactiveSwift-----------")
//ReactiveSwift
let (leftOutput,leftInput) = Signal<Int, Never>.pipe()
let (rightOutput,rightInput) = Signal<Int, Never>.pipe()


let combinedSignalProducer = SignalProducer<Int, Never>.combineLatest(leftOutput,rightOutput)
    
combinedSignalProducer.startWithValues{
    value in
    print(value)
}
leftInput.send(value:5)
rightInput.send(value:3)
leftInput.send(value:2)
rightInput.send(value:1)
leftInput.send(value:99)
