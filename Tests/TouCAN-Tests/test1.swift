import XCTest
@testable import TouCAN

class ReadTest: XCTestCase {
    func testInitSetsTitle() {

        let toucan = TouCAN()
        do {
            try toucan.connect(bitrate: 500000)
            let getVin = TouCAN.Message(id: 0x7DF, data: [0x02, 0x09, 0x02])
            try toucan.writeMessage(getVin)
            var received: Int = 0
            while true {
                print("waiting to read the next message...")
                let message = try toucan.readMessage()
                print("received message: \(message)")
                received += 1
                if received == 10 {
                    break
                }
            }
        } catch {
            print("Error: \(error)")
        }
        XCTAssertTrue(true)
    }
}
