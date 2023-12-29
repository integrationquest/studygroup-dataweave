%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from StudyGroup
---
"StudyGroup" describedBy [
    "deepRenameKey" describedBy [
            "It should rename a key in a simple object" in do {
                var simpleObject = {
                    Key: "abc",
                    Value: 42
                }
                ---
                deepRenameKey(simpleObject, "Key", "Name") must equalTo({
                    Name: "abc",
                    Value: 42
                })
            },
            "It should rename a key in a simple object inside an array" in do {
                var arrayInput = [
                    { Key: "abc", Value: 42 }, 
                    { Key: "def", Value: -1}
                ]
                ---
                deepRenameKey(arrayInput, "Key", "Name") must equalTo([
                    { Name: "abc", Value: 42 },
                    { Name: "def", Value: -1 }
                ])
            },
            "It should rename a key in a nested object" in do {
                var nestedInput = {
                    Level1: {
                        Key: "abc",
                        Value: 42
                    }
                }
                ---
                deepRenameKey(nestedInput, "Key", "Name") must equalTo({
                    Level1: {
                        Name: "abc",
                        Value: 42
                    }
                })
            }
        ],
]
