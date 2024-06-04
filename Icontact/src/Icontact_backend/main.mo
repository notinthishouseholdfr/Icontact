import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Array "mo:base/Array";


actor Phonebook {
  type Entry = {
    name : Text;
    phone : Text;
  };

  stable var entries : [Entry] = [];

  public query func getEntries() : async [Entry] {
    return entries;
  };

  public func addEntry(name : Text, phone : Text) : async () {
    entries := Array.append(entries, [{ name; phone }]);
  };

  public func deleteEntry(name : Text) : async () {
    entries := Array.filter<Entry>(entries, func(entry) { entry.name != name });
  };

  public func updateEntry(name : Text, newPhone : Text) : async () {
    entries := Array.map<Entry, Entry>(
      entries,
      func(entry) {
        if (entry.name == name) {
          { name = entry.name; phone = newPhone };
        } else {
          entry;
        };
      },
    );
  };
};
