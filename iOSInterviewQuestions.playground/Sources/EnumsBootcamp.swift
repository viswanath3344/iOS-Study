enum NormalEnum: Int {
    case passValue = 35
    case districtValue = 70
}

enum PizzaSize: String, CaseIterable {
    case small
    case medium
    case regular
}

func main3() {
    for pizza in PizzaSize.allCases {
        print(pizza.rawValue)
    }
    
    let smallPizza = PizzaSize(rawValue: "small")
    print(smallPizza)
}

func main2(){
    let enum1 = NormalEnum(rawValue: 35)
    print(enum1)
    
    let enum2 = NormalEnum(rawValue: 70)
    print(enum2)
}

enum AssociatedEnum {
    case name
    case age(value: Int)
    case salary(value: Double)
}

func main()  {
    let salaryEnum = AssociatedEnum.salary(value: 2000)
    
    switch salaryEnum {
    case .name:
        print("name")
        break
    case .age(let value):
        print(value)
    case .salary(let value):
        print(value)
    }
    
}

//main()

//main2()

main3()


