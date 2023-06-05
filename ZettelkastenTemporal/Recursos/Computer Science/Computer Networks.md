## Basic Characteristics of computer network
> Fault Tolerance
> - Continue working despite failures
> - Ensure no loss of service

> Scalability
> - Grow based on the needs
> - Have good performance after growth

> Quality of Service
> - Set Priorities
> - Manage data traffic reduce data loos delay etc

> Security
> The hability to prevent
> - Unauthorized access
> - Misuse
> - Forgery
> The ability to provide
> - Confidentality
> - Integrity
> - Availability

## Network Protocols & Communication

### Data Communication
- Data communication are the exchange of data between two nodes via some form of link such as a cable
> Data flow - Simplex
> Communication is always unidirectional
> One device can trasmit and the other device will receive
> Example: Keyboards, Traditional monitors.

> *Data Flow - Half Duplex*
> Communication is in bot directions but not at the same time
> If one device is sendig the other can only receive and vice versa.
> Example: Walkie-Talkies.

All communication schemes will have the following things in common:
- Source or sender
- Destination or receiver
- Channel or media
Rules or protocols govern all methods of communication.

> Protocol determines
> - What is communicated?
> - How its communicated?
> - When is communicated?

Protocols are necessary for humman communication and include:
- An identified sender and receiver
- Common language and grammar
- Speed and timing of delivery
- Confirmation or acknowledgment requirements

#### Protocols - Network Communication<<<
Protocols used in network communications also define
- Message encoding
- Message source -> Encoder -> Transmitter -> Transmission Medium -> Receiver. -> Decoder -> message destination
- Message formatting and encapsulation: Agreed format, encapsulate the information the sender and the receiver rightly
- Message timing: Flow control Response timeout
- Message size: Crea mensajes pequeños en vez de mensajes grandes para mejor entendimiento
- Message delivery options: - Unicast multicast Broadcast
### Peer to peer network
- No centralized administration
- All peers are equal
- Simple sharing applications
- Not scalable
#### Client Server Network
- Centralized administration
- Request-Response model.
- Scalable
- Server may be overloaded