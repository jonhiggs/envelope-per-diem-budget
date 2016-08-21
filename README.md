# Budget

A set of rules and helper scripts to simplify the maintenance of a per-diem budget.

- Low overheads
- Minimise impulsive purchases
- Avoid missing out or breaking budget due to lack of planning or unforeseeable circumstances.
- Easy to restart if you make a mistake.
- You can start at any point in the month.

Parcelling myself out cash on a daily basis makes it easy to not inadvertently overspend on the little things. However, it is impossible for me to pay for the irregular, costly things like a tank full of petrol, a new pair of shoes or a friends birthday dinner.

With better planning at the start of each month, I hope that this tool will make it easy.


## Rules

All living costs are to come from per-diem:

- Food
- Fuel
- Entertainment
- Consumables
- Small purchases (books, music, clothing)
- Large purchases (furniture, toys, gadgets)


Any ongoing commitments are considered bills. As they cannot be manipulated by mindful spending, they are excluded:

- Rent
- Electricity
- Internet
- Telephone


Emergencies do not need to come from per-diem:

- Any medical treatment
- Car repairs
- Appliance replacement


Any extra money goes into your days per-diem:

- Overtime
- Sale of items
- Gifts

---

## How it works

At the start of the month, you pay your bills, determine how much you need to live off for the month, then put the rest into a savings account.

For each day, you give yourself a per-diem.

Every Friday, you give yourself a weekend bonus to make sure you have enough money to have some fun.


## How to use

On Pay Day:

1. Pay bills and update `./bills.yml` with the costs.
1. Calculate your savings with `./savings` and make deposit.
1. Calculate your months budget with `./budget`.

Every Day:

1. Take your per-diem from your cash buffer.
1. Make sure you're tracking well if you want to.

Friday:

1. Take your weekend bonus from your cash buffer



## Values

- Per-Diem Buffer: Amount of money per day that is put aside for the big irregular things like fuel.
- Per-Diem Cash: How much money you doll out to yourself each day.
- Weekend Bonus: Extra cash to make the weekend that little bit more fun.
