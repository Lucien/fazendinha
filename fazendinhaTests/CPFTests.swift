import XCTest
import fazendinha

class CPFTests: XCTestCase {

    var cpfGroup: [CPF]!

    override func setUp() {
        super.setUp()

        self.cpfGroup = [
            try! CPF(number: "000.000.000-00"),
            try! CPF(number: "111.111.111-11"),
            try! CPF(number: "222.222.222-22"),
            try! CPF(number: "333.333.333-33"),
            try! CPF(number: "444.444.444-44"),
            try! CPF(number: "555.555.555-55"),
            try! CPF(number: "666.666.666-66"),
            try! CPF(number: "777.777.777-77"),
            try! CPF(number: "888.888.888-88"),
            try! CPF(number: "999.999.999-99"),
            try! CPF(number: "520.852.930-00"),
            try! CPF(number: "000.000.001-91"),
            try! CPF(number: "544.780.212-10"),
            try! CPF(number: "813.219.583-31"),
            try! CPF(number: "602.586.714-32"),
            try! CPF(number: "334.028.435-01"),
            try! CPF(number: "545.462.246-05"),
            try! CPF(number: "100.000.987-44"),
            try! CPF(number: "135.991.648-27"),
            try! CPF(number: "286.714.209-14"),
            try! CPF(number: "728.793.773-58"),
            try! CPF(number: "704.881.802-60"),
            try! CPF(number: "508.584.317-77"),
            try! CPF(number: "517.531.566-88"),
            try! CPF(number: "050.505.834-03"),
            try! CPF(number: "337.718.534-86"),
            try! CPF(number: "827.525.778-69"),
            try! CPF(number: "255.463.315-00"),
            try! CPF(number: "464.761.285-66"),
            try! CPF(number: "926.595.192-34")
        ]
    }

    func testInvalidCPFInputFormatWith10Chars() throws {

        XCTAssertThrowsError(try CPF(number: "7715350466"), "") {
            (error: Error) in
            guard let cpfError = error as? InputError else {
                XCTFail()
                return
            }
            XCTAssertEqual(cpfError, .invalidFormat)
        }
    }

    func testInvalidCPFInputFormatWith11Chars() throws {

        XCTAssertThrowsError(try CPF(number: "1556122322A"), "") {
            (error: Error) in
            guard let cpfError = error as? InputError else {
                XCTFail()
                return
            }
            XCTAssertEqual(cpfError, .invalidFormat)
        }
    }

    func testInvalidCPFInputFormatWith14Chars() throws {

        XCTAssertThrowsError(try CPF(number: "155.612.232-2-"), "") {
            (error: Error) in
            guard let cpfError = error as? InputError else {
                XCTFail()
                return
            }
            XCTAssertEqual(cpfError, .invalidFormat)
        }
    }

    func testInvalidCPFInputFormatWith14CharsAndInvalidSeparators() throws {

        XCTAssertThrowsError(try CPF(number: "155-612-232-24"), "") {
            (error: Error) in
            guard let cpfError = error as? InputError else {
                XCTFail()
                return
            }
            XCTAssertEqual(cpfError, .invalidFormat)
        }
    }

    func testMaskedNumberFromPlainNumber() throws {

        let cpf = try CPF(number: "15561223224")
        XCTAssertEqual(cpf.maskedNumber, "155.612.232-24")
    }

    func testInvalidCPFsUsingFazendaAlgorythm() throws {

        XCTAssertFalse(try CPF(number: "000.000.000-00").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "111.111.111-11").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "222.222.222-22").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "333.333.333-33").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "444.444.444-44").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "555.555.555-55").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "666.666.666-66").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "777.777.777-77").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "888.888.888-88").isValid(validationAlgorythm: .fazenda))
        XCTAssertFalse(try CPF(number: "999.999.999-99").isValid(validationAlgorythm: .fazenda))
    }

    func testValidCPFsUsingFazendaAlgorythm() throws {


//        XCTAssertTrue(try CPF(number: "100.000.987-44").isValid(validationAlgorythm: .fazenda))
//        XCTAssertTrue(try CPF(number: "520.852.930-00").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "000.000.001-91").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "544.780.212-10").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "813.219.583-31").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "602.586.714-32").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "334.028.435-01").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "545.462.246-05").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "100.000.987-44").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "135.991.648-27").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "286.714.209-14").isValid(validationAlgorythm: .fazenda))

        XCTAssertTrue(try CPF(number: "728.793.773-58").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "704.881.802-60").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "508.584.317-77").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "517.531.566-88").isValid(validationAlgorythm: .fazenda))

        XCTAssertTrue(try CPF(number: "050.505.834-03").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "337.718.534-86").isValid(validationAlgorythm: .fazenda))
        XCTAssertTrue(try CPF(number: "827.525.778-69").isValid(validationAlgorythm: .fazenda))
    }

    func testValidCPFsUsingSimpleAlgorythm() throws {
        XCTAssertTrue(try CPF(number: "520.852.930-00").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "000.000.001-91").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "544.780.212-10").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "813.219.583-31").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "602.586.714-32").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "334.028.435-01").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "545.462.246-05").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "100.000.987-44").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "135.991.648-27").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "286.714.209-14").isValid(validationAlgorythm: .simple))

        XCTAssertTrue(try CPF(number: "728.793.773-58").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "704.881.802-60").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "508.584.317-77").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "517.531.566-88").isValid(validationAlgorythm: .simple))

        XCTAssertTrue(try CPF(number: "050.505.834-03").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "337.718.534-86").isValid(validationAlgorythm: .simple))
        XCTAssertTrue(try CPF(number: "827.525.778-69").isValid(validationAlgorythm: .simple))
    }

    func testFiscalRegion() throws {
        XCTAssertEqual(try CPF(number: "000.000.000-00").fiscalRegion, FiscalRegion.fR10)
        XCTAssertEqual(try CPF(number: "111.111.111-11").fiscalRegion, FiscalRegion.fR1)
        XCTAssertEqual(try CPF(number: "222.222.222-22").fiscalRegion, FiscalRegion.fR2)
        XCTAssertEqual(try CPF(number: "333.333.333-33").fiscalRegion, FiscalRegion.fR3)
        XCTAssertEqual(try CPF(number: "444.444.444-44").fiscalRegion, FiscalRegion.fR4)
        XCTAssertEqual(try CPF(number: "555.555.555-55").fiscalRegion, FiscalRegion.fR5)
        XCTAssertEqual(try CPF(number: "666.666.666-66").fiscalRegion, FiscalRegion.fR6)
        XCTAssertEqual(try CPF(number: "777.777.777-77").fiscalRegion, FiscalRegion.fR7)
        XCTAssertEqual(try CPF(number: "888.888.888-88").fiscalRegion, FiscalRegion.fR8)
        XCTAssertEqual(try CPF(number: "999.999.999-99").fiscalRegion, FiscalRegion.fR9)
    }

    func testStatesForFiscalRegion02() throws {


        let cpf = try CPF(number: "182.557.422-71")
        let states = 🇧🇷.states.filter { (state: State) -> Bool in
            return state.fiscalRegion == .fR2
        }

        XCTAssertEqual(cpf.states, states)
    }

    func testSimpleAlgorithmsSpeed() throws {
        measure {

            for cpf in self.cpfGroup {
                _ = cpf.isValid(validationAlgorythm: ValidationAlgorythm.simple)
            }
        }
    }

    func testFazendaAlgorythmSpeed() throws {
        measure {
            for cpf in self.cpfGroup {
                _ = cpf.isValid(validationAlgorythm: ValidationAlgorythm.fazenda)
            }
        }
    }
}
