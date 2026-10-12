product <- data.frame(
  id = c(101:105),
  name = c("Tissue", "Phone", "Milo", "L'Oreal", "Mouse"),
  price = c(200, 300, 400, 500, 600),
  category = c("Hygiene", "Electronics", "Beverage", "Cosmetics", "Electronics"),
  available = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)
product[product$price > 300, ]
