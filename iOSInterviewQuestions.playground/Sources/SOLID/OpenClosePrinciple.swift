struct Product {
    let name: String
    let size: Size
    let color: Color
    
    enum Size {
        case small
        case medium
        case big
    }
    
    enum Color {
        case silver
        case grey
        case golden
    }
}

struct Category {
    let name: String
    let id: Int
}

// Specification and Filter protocol are generic, can be used for any array filter, just need to write specific Filter.
protocol Specification {
    associatedtype T
    func isSatisfied(item: T) -> Bool
}

protocol Filter {
    associatedtype T
    
    func filter <Spec: Specification>(items: [T], spec: Spec) -> [T] where Spec.T == T
}

struct ProductsFilter: Filter {
    typealias T = Product
    
    func filter<Spec>(items: [Product], spec: Spec) -> [Product] where Spec : Specification, Product == Spec.T {
        items.filter{spec.isSatisfied(item: $0)}
    }
}

struct CategoryFilter: Filter {
    typealias T = Category
    
    func filter<Spec>(items: [Category], spec: Spec) -> [Category] where Spec : Specification, Category == Spec.T {
        items.filter{spec.isSatisfied(item: $0)}
    }
}

struct CategoryIDSpecification: Specification {
    typealias T = Category
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func isSatisfied(item: Category) -> Bool {
        id == item.id
    }
}

struct ColorSpecification: Specification {
    typealias T = Product
    
    let color: Product.Color
    
    init(color: Product.Color) {
        self.color = color
    }
    
    func isSatisfied(item: Product) -> Bool {
        item.color == color
    }
}

struct SizeSpecification: Specification {
    typealias T = Product
    
    let size: Product.Size
    
    init(size: Product.Size) {
        self.size = size
    }
    
    func isSatisfied(item: Product) -> Bool {
        item.size == size
    }
}

struct AndSpecification <T,
                         Spec1: Specification,
                         Spec2: Specification
>: Specification where Spec1.T == Spec2.T, T == Spec1.T, T == Spec2.T {
    
    let spec1: Spec1
    let spec2: Spec2
    
    init(spec1: Spec1, spec2: Spec2) {
        self.spec1 = spec1
        self.spec2 = spec2
    }
    
    func isSatisfied(item: T) -> Bool {
        spec1.isSatisfied(item: item) && spec2.isSatisfied(item: item)
    }
}

func main() {
    print("Main Function")
    
    let product1 = Product(name: "Mac Book Air", size: .medium, color: .golden)
    let product2 = Product(name: "Mac Book pro", size: .small, color: .silver)
    
    let products = [product1, product2]
    
    let andSpec = AndSpecification(spec1: ColorSpecification(color: .golden), spec2: SizeSpecification(size: .medium))
    
    let results = ProductsFilter().filter(items: products, spec: andSpec)
    
    print(results)
    
    let category1 = Category(name: "Electronics", id: 123)
    let category2 = Category(name: "Mobiles", id: 1292)
    
    let categoryResults = CategoryFilter().filter(items: [category1, category2], spec: CategoryIDSpecification(id: 1292))
    
    print(categoryResults)
    
}

main()

