Business rules kata
===================

The way I'd approach this problem is through a DSL, likely in JSON format.

To illustrate what I am thinking:

    {
        "rule": "book::packing_slip::royalty",
        "forObjectType": {
            "tangible": true,
            "identity": "book"
        },
        "action": {
            "duplicate": {
                "interface": "function_interface_name_goes_here",
                "args": []
            }
        }
    }

Tags can trivially be computed on the fly, or explicitly mentioned within a `tags` key.

Then they are all collected in an easily searchable store (e.g.: Redis) so that \
they can quickly respond to incoming events.

An endpoint would be exposed to enable new rules to be added/removed from the store.
