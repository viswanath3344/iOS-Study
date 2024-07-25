// MARK: ADAPTER DESIGN PATTERN

/* Works as bridge between two in compatible

 Example: Power Adapter from India to US
 
 Use cases: If you want to implement modern way on top of classic way , then you can go with adpater pattern.

 Adapter pattern takes the adoptee as dependency inject and modify the as per the requirment.
 
*/
protocol ModernDataFetcher {
    func fetchData(url: String, completion: @escaping (Result<String, Error>) -> Void)
}

class ClassicDataFetcher {
    
    func fetchData(url: String, completion: @escaping (Data, Error?) -> Void) {
        let result = "Classic data"
        completion(Data(result.utf8), nil)
    }
}


class ModernFetchAdapter: ModernDataFetcher {
    
    let classicDataFetcher: ClassicDataFetcher
    
    init(classicDataFetcher: ClassicDataFetcher) {
        self.classicDataFetcher = classicDataFetcher
    }
    
    func fetchData(url: String, completion: @escaping (Result<String, Error>) -> Void) {
        classicDataFetcher.fetchData(url: "") { data, error in
            guard let result = String(data: data, encoding: .utf8)else { return }
            completion(.success(result))
        }
    }
}

func main() {
    
    let classDataFetcher = ClassicDataFetcher()
    
    let modernDataFetcher = ModernFetchAdapter(classicDataFetcher: classDataFetcher)
    
    modernDataFetcher.fetchData(url:"") { result in
        switch result {
        case .success(let success):
            print(success)
        case .failure(let failure):
            print(failure)
        }
    }
}

main()
