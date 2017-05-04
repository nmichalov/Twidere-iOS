// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import PMJackson

extension AccountDetails.Extras: JsonMappable {

}

internal class AccountDetailsExtrasJsonMapper: JsonMapper<AccountDetails.Extras> {

    internal static let singleton = AccountDetailsExtrasJsonMapper()

    override internal func parse(_ parser: JsonParser) -> AccountDetails.Extras! {
        let instance = AccountDetails.Extras()
        if (parser.currentEvent == nil) {
            parser.nextEvent()
        }

        if (parser.currentEvent != .objectStart) {
            parser.skipChildren()
            return nil
        }

        while (parser.nextEvent() != .objectEnd) {
            let fieldName = parser.currentName!
            parser.nextEvent()
            parseField(instance, fieldName, parser)
            parser.skipChildren()
        }
        return instance
    }

    override internal func parseField(_ instance: AccountDetails.Extras, _ fieldName: String, _ parser: JsonParser) {
        switch fieldName {
        default:
            break
        }
    }
}
