#java script object notation: storing and exchanging data between machines.
# Key and value pair. Value could be array if key has multiple values..Ex- City.
#Value can has further key and value pairs known as json Object. Ex- Address key.

#{
"Name":"John",
"Age":"30",
"Mob":"78979",
"City":["Hyderabad","Mumbai","Bangalore"],
"Address":
            {
              "Street":"XYZ",
              "House#":"456",
               "Number":[
                        {
                        "Mob#":"Mob1",
                        "Land#":"Land1"
                        },
                        {
                        "Mob#":"Mob2",
                        "Land#":"Land2"
                        }

                        ]
            }

}#

#Json Path.com
#https://jsonpathfinder.com/
To fetch Mob#: .Address.Number.Land#
To Fetch House#: .House