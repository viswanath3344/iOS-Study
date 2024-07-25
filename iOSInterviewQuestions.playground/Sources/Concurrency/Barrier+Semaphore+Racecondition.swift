import Foundation

// Data Racing

struct User {
    let name: String
    let numberOfTickets: Int
}


class TicketBookingViewModel {
    var availableTickets: Int = 5
    
    var users = [
        User(name: "Viswa", numberOfTickets: 3),
        User(name: "Ravs", numberOfTickets: 2),
        User(name: "Hanvika", numberOfTickets: 3),
        User(name: "Dharma", numberOfTickets: 2)
    ]
   
    let queue = DispatchQueue(
        label: "com.bookingTickets.Movies",
        attributes: .concurrent
    )
    
    let semaphore = DispatchSemaphore(value: 1)
    
    func bookTicketsUsingBarrier() {
        for user in users {
            queue.async(flags: .barrier) { // Moves async to synchronous way
                    self.bookTicket(for: user)
            }
        }
    }
    
    func bookTicketsUsingSemaphore() {
        for user in users {
            queue.async {
                self.semaphore.wait()
                self.bookTicket(for: user)
                self.semaphore.signal()
            }
        }
    }
    
    private func bookTicket(for user: User) {
        print("Ticket booking started for \(user.name) with tickets \(user.numberOfTickets)")
        sleep(1)
        print("Available Tickets \(self.availableTickets)")
        if user.numberOfTickets <= self.availableTickets {
            print("Ticket confirmed to \(user.name)")
            self.availableTickets = self.availableTickets - user.numberOfTickets
        }else {
            print("Ticket Failed to \(user.name)")
        }
        print("XXXXXXXXXXXXXXXXXXXXXXXX")
    }
}

func doSomeOtherTask() {
    print("Other Task")
}

func main() {
  let vm = TicketBookingViewModel()
    vm.bookTicketsUsingSemaphore()
    doSomeOtherTask()
}

main()
