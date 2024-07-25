import Foundation

struct Response: Codable {
    let id, name: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let year: Int
    let price: Double
    let cpuModel, hardDiskSize: String

    enum CodingKeys: String, CodingKey {
        case year, price
        case cpuModel = "CPU model"
        case hardDiskSize = "Hard disk size"
    }
}


class DataManager {
    let group = DispatchGroup()
    func getData() {
        guard let url = URL(string: "https://api.restful-api.dev/objects/7") else {
            return
        }
        
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            self?.group.leave()
            guard let data else { return }
            do {
                let result = try JSONDecoder().decode(Response.self, from: data)
                print(result)
            } catch {
                print(error)
            }
        }.resume()
    }

    
    
     let queue = DispatchQueue(
         label: "com.bookingTickets.Movies",
         attributes: .concurrent
     )
//    let concurrentQueue = DispatchQueue(label: "com.dispatchGroup.test")
    func testDispatchGroup() {
        queue.async {
            self.group.enter()
            self.getData()
            
            self.group.enter()
            self.getData()
            
            // Works similar to notify if you are doing in async environment, but blocks the synchronus environment.
            
//            self.group.wait()
//
//            DispatchQueue.main.async {
//
//            }
            self.group.notify(queue: .main) {
                print("Items fetched twice")
            }
        }
        
    }
}

func main() {
    DataManager().testDispatchGroup()
}

main()
