# Swift-TouCAN

User-Space Driver for the Rusoku TouCAN Adapter – optimized for Swift.

## Fork Notice

This is a fork of [RusokuCAN](https://github.com/mac-can/RusokuCAN) with a slightly different take on the Swift interface.

My main objective for this fork is to keep every Swift-CAN driver conforming to the abstract [Swift-CAN](https://github.com/Automotive-Swift/Swift-CAN) interface. That way we can easily develop apps both for Linux (where SocketCAN is used) and Apple platforms (where MacCAN is used).

Everything but the Swift glue code and packaging is copyright © 2020-2021 Uwe Vogt, UV Software, Berlin (info@mac-can.com).

**NOTE**: *In contrast to all other projects under the [Automotive-Swift](https://github.com/Automotive-Swift) umbrella, this code is NOT licensed under MIT, but rather (L)GPL – please see the respective licenses in the source files.*
