# CashRegister

The is a proof of concept project that creates a cash register where you can add items, select state tax, apply predefined discounts and calculate total items value.


#### 1. Prerequisites

Xcode 10.2

#### 2. Getting started

##### Clone the project

    git clone https://github.com/abouariu/CashRegister.git

##### Run project

Open `CashRegister.xcodeproj`.

Run tests (`cmd + U`).

Run project (`cmd + R`).

##### Use the application
To add items, use the lower left button and add item name, quantity and price.

To check out, use the lower right button. Before checking out, a state must be selected in order to apply the state tax.

During checkout, a discount is automatically applied based on items quantity:

	Quantity > 1000 applies 3% discount
	Quantity > 5000 applies 5% discount
	Quantity > 7000 applies 7% discount
	Quantity > 10000 applies 10% discount
	Quantity > 50000 applies 15% discount
