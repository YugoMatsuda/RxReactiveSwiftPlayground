import RxSwift
//import RxCocoa
import ReactiveSwift


//let disposeBag = DisposeBag()
//
////RxSwift
//print("--------RxSwift-----------")
//struct RxStudent {
//    var score: BehaviorRelay<Int>
//}
//
//let rxJohn = RxStudent(score: BehaviorRelay(value: 75))
//let rxMary = RxStudent(score: BehaviorRelay(value: 95))
//
//let student = PublishSubject<RxStudent>()
//
//student.asObservable()
//    .flatMap { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//student.onNext(rxJohn)
//rxJohn.score.accept(100)
//
//student.onNext(rxMary)
//rxMary.score.accept(80)
//
//rxJohn.score.accept(43)


//ReactiveSwift
print("--------ReactiveSwift-----------")
struct ReactiveStudent {
    var score: MutableProperty<Int>
}
let reactiveJohn = ReactiveStudent(score: MutableProperty<Int>(75))
let reactiveMary = ReactiveStudent(score: MutableProperty<Int>(95))

let (output, input) = Signal<ReactiveStudent, Never>.pipe()
output.flatMap(.merge) { (reactiveStudent: ReactiveStudent) ->  SignalProducer<Int, Never> in
    return reactiveStudent.score.producer
}.observe{ value in
    print(value.value)
}
input.send(value: reactiveJohn)
input.send(value: reactiveMary)
reactiveJohn.score.value = 100
reactiveMary.score.value = 20
