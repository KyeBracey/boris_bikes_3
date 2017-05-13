# Boris Bikes
Makers Academy Week 1 Challenge

## Overview

This program emulates the Boris Bikes (Santander Cycles) system in London.

## Features

- Allows the user to create new `DockingStation` and `Bike` objects
- Docking stations can be passed an Integer to set a bike capacity, or default to 20

- Allows the user to report a bike as broken `Bike#report_broken`

- Allows the user to dock bikes at docking stations `DockingStation#dock(bike)`
- Docking stations accept bikes whether or not they are broken
- Docking stations raise an error if the user tries to dock a bike at a full station

- Allows the user to release a bike from a docking station `DockingStation#release_bike`
- Docking stations raise an error when trying to release a bike from an empty station
- Docking stations raise an error when trying to release a bike if all bikes are broken
