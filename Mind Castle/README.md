#  Mind Castle Development Notes
Overview
----

Mind Castle is a productivity tool that combines elements of knowledge management, markup (or note taking), scalable project management, and communications into a framework. The use of the term framework is very much purposeful. Mind Castle is an architecture for people who work with information and the apps and tools that come with Mind Castle are meant to be modded and redistributed. While most of the core components are proprietary (with the plan to eventually release as open source), a robust API is a key goal of the project, with modification being the expectation. This is possible through adherance to a few Mind Castle standards.

Data Structure: Node
---

The base Mind Castle data structure is the node. It is the central currency of all castle transactions and stores stateful information for every room. Nodes are highly configurable and can adopt a variety of traits. Views can impose a sort of protocol depending on the room they inhabit (or are invoked in). Depending on the type of scene they are called into there are certain contractual requirements necessary (hence the protocol nature of the node). These are runtime configurable, however, and thus a feature that sits on top of the core functionality of Mind Castle. In this sense, node functionality is interpreted.

The essential node requirement is that they have an identifier. This Id is generated automatically to reduce collisions and compute time to call the entirety of the database (worst case scenario). The whole reason there are rooms is that different nodes can be linked to a room without adopting a tag. This is part of the Mind Castle magic formula. The unique arrangement of nodes to each other is based on the room they are in. Relational information is dependent on the room(s).



